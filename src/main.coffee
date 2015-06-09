require "coffee-react/register"

Fs = require "fs"
App = require "./react/app"
Team = require "./react/team"
Input = require "./react/input"
Config = require "./config"
Message = require "./react/message"
Channel = require "./react/channel"
SlackConnection = require "./slack_connection"

chatApp = React.createElement App, {key: "global", connections: [ ] }

tokenFile = "#{process.env.HOME}/.peonies.json"
config = new Config tokenFile
for token in config.tokens
  connection = new SlackConnection(token, document)
  connection.on "login", (conn, user, team) ->
    team = new React.createElement Team, {key: team.id, user: team, team: team, connection: conn, channels: []}
    chatApp.props.connections.push(team)
    React.render chatApp, document.getElementById("chat-app")
  connection.on "message", (conn, msg) ->
    console.log "Message Received: #{msg.ts} - #{msg.type}:#{msg.subtype} - #{msg.text}"

    teamId = msg._client.team.id
    team = (team for team in chatApp.props.connections when team.key is teamId)[0]

    channel = (channel for channel in team.props.channels when channel.key == msg.channel)[0]

    unless channel?
      for channelId, info of team.props.connection.client.channels
        if channelId == msg.channel
          channel = new React.createElement Channel, {key: channelId, name: info.name, info: info, team: team, messages: []}
          team.props.channels.push(channel)

    if channel?
      user = team.props.connection.client.users[msg.user]
      if user?
        message = React.createElement Message, {key: msg.ts, msg: msg, user: user, channel: channel }
        channel.props.messages.push(message)

        console.log "#{msg._client.team.name} / #{channel.props.name} / #{user.name} - #{msg.text}"
      else
        console.log "probably a bot - #{msg.subtype}"

      # Handle message updates - image/youtube updates
      if msg.subtype == "message_changed"
        message = (message for message in channel.props.messages when message.key.split(".")[0] == msg.ts.split(".")[0])[0]
        if message?
          console.log "Message changed: #{msg.ts}"
        else
          console.log "Unable to find message"
    React.render chatApp, document.getElementById("chat-app")

setTimeout ( ->
  inputBar = React.createElement Input, {key: "input-bar-1", app: chatApp}
  React.render inputBar, document.getElementById("input-bar")

  React.render chatApp, document.getElementById("chat-app")
), 500
