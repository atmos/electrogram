Fs = require "fs"

Team            = require "./team"
Config          = require "../config"
AppElement      = require "../react/app"
SlackConnection = require "../slack_connection"

class App
  constructor: (@document) ->
    tokenFile = "#{process.env.HOME}/.electrogram.json"
    @config = new Config tokenFile
    @connections = { }
    @reactElement = React.createElement AppElement, {key: "global", parent: @ }

  setup: () ->
    for token in @config.tokens
      @addConnection(new SlackConnection(token))

  teamForName: (name) ->
    team = (team for teamId, team of @connections when team.name() is name)
    if team? then team[0] else null

  addConnection: (connection) ->
    connection.on "login", (conn, user, team) =>
      team = new Team(@, conn, user, team)
      @connections[user.id] = team

      for preferredChannel in @config.channels
        [teamName, channelName] = preferredChannel.name.split("#")
        if teamName is team.team.name
          for channelId, channel of conn.client.channels
            if channelName is channel.name
              console.log channelName
              # channel.fetchHistory()

      setTimeout ( =>
        connection.client.autoMark = true
        React.render @reactElement, document.getElementById("chat-app")
      ), 5000


    connection.on "message", (conn, msg) =>
      console.log "Message Received: #{msg.ts} - #{msg.type}:#{msg.subtype} - #{msg.text}"

      #teamId = msg._client.team.id
      #team = (team for team in chatApp.props.connections when team.key is teamId)[0]

      #channel = (channel for channel in team.props.channels when channel.key == msg.channel)[0]

      #unless channel?
      #  for channelId, info of team.props.connection.client.channels
      #    if channelId == msg.channel
      #      channel = new React.createElement ChannelElement, {key: channelId, name: info.name, info: info, team: team, messages: []}
      #      team.props.channels.push(channel)

      #if channel?
      #  user = team.props.connection.client.users[msg.user]
      #  if user?
      #    message = React.createElement MessageElement, {key: msg.ts, msg: msg, user: user, channel: channel }
      #    channel.props.messages.shift() if channel.props.messages.length > 50
      #    channel.props.messages.push(message)

      #    console.log "#{msg._client.team.name} / #{channel.props.name} / #{user.name} - #{msg.text}"
      #  else
      #    console.log "probably a bot - #{msg.subtype}"

module.exports = App
