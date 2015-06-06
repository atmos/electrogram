require("coffee-react/register")

Fs = require 'fs'
Team = require './react/team'
ChatApp = require './react/chat_app'
Message = require './react/message'
Channel = require './react/channel'
SlackConnection = require './slack_connection'

chatApp = React.createElement ChatApp, {key: "global", connections: [ ]}

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
            console.log info.name
            channel = new React.createElement Channel, {key: channelId, name: info.name, info: info, team: team, messages: []}
            team.props.channels.push(channel)

      message = React.createElement Message, {key: msg.id, msg: msg, channel: channel}

      channel.props.messages.push(message)

      if msg.type == 'message'
        item = "<li>#{msg._client.team.name} / #{msg.channel} / #{msg.user} - #{msg.text}</li>"
        console.log item
      else
        console.log "Unknown message type, #{msg.type}"

      React.render chatApp, document.getElementById("chat-app")
