Fs = require "fs"

Team            = require "./team"
Config          = require "../config"
Channel         = require "./channel"
AppElement      = require "../react/app"
MessageElement  = require "../react/message"
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
              channel.fetchHistory()

      setTimeout ( =>
        connection.client.autoMark = true
        React.render @reactElement, document.getElementById("chat-app")
      ), 5000


    connection.on "message", (conn, msg) =>
      console.log "Message Received: #{msg.ts} - #{msg.type}:#{msg.subtype} - #{msg.text}"

      team = @teamForName(msg._client.team.name)

      channel = team.channels[msg.channel]
      unless channel?
        for channelId, channel of team.apiChannels()
          if channelId is msg.channel
            channel = new Channel(team, channelId)
            team.addChannel(channel)

      if channel?
        console.log "Message team:channel is: #{team.name()}:#{channel.name()}"
        user = team.connection.client.users[msg.user]

        if user?
          console.log user
          message = React.createElement MessageElement, {key: msg.ts, msg: msg, user: user, channel: channel }
      #    channel.props.messages.shift() if channel.props.messages.length > 50
      #    channel.props.messages.push(message)

      #    console.log "#{msg._client.team.name} / #{channel.props.name} / #{user.name} - #{msg.text}"
      #  else
      #    console.log "probably a bot - #{msg.subtype}"

module.exports = App
