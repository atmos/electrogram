require("coffee-react/register")

Fs = require 'fs'
App = require './react/app'
Team = require './react/team'
Message = require './react/message'
Channel = require './react/channel'
SlackConnection = require './slack_connection'

chatApp = React.createElement App, {key: "global", connections: [ ]}

tokenFile = "#{process.env.HOME}/.peonies.json"
Fs.readFile tokenFile, (err, data) ->
  throw err if err
  tokens = JSON.parse(data)
  for token in tokens
    connection = new SlackConnection(token, document)
    connection.on "login", (conn, user, team) ->
      team = new React.createElement Team, {key: team.id, user: team, team: team, connection: conn, channels: []}

      chatApp.props.connections.push(team)
      React.render chatApp, document.getElementById("chat-app")
    connection.on "message", (conn, msg) ->
      teamId = msg._client.team.id
      team = (team for team in chatApp.props.connections when team.key is teamId)[0]

      channel = (channel for channel in team.props.channels when channel.key == msg.channel)[0]

      unless channel?
        for channelId, info of team.props.connection.client.channels
          if channelId == msg.channel
            channel = new React.createElement Channel, {key: channelId, name: info.name, info: info, team: team, messages: []}
            team.props.channels.push(channel)

      if channel?
        message = React.createElement Message, {key: msg.ts, msg: msg, channel: channel}
        channel.props.messages.push(message)

      if msg.type == 'message'
        if msg.subtype == 'bot_message'
          console.log msg.subtype
        item = "#{msg._client.team.name} / #{message.props.channel.props.name} / #{msg.user} - #{msg.text}"
        console.log item

      React.render chatApp, document.getElementById("chat-app")
