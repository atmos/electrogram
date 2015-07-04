Channel     = require "./channel"

class Team
  constructor: (@app, @connection, @user, @team) ->
    options =
      key: @team.id
      user: @user
      team: @team
      parent: @app
      connection: @connection

    @channels = { }

  name: () ->
    @team.name

  apiChannels: () ->
    @connection.client.channels

  channelForNameOrId: (name, id) ->
    if @channels[id]?
      @channels[id]
    else
      channel = (channel for channelId, channel of @apiChannels() when channel.name is name)
      if channel?
        @channels[id] = new Channel(@, id)
        @channels[id]
      else
        null

module.exports = Team
