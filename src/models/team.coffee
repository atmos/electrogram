Fs = require "fs"

TeamElement = require "../react/team"

class Team
  constructor: (@app, @connection, @user, @team) ->
    options =
      key: @team.id
      user: @user
      team: @team
      parent: @app
      connection: @connection

    @channels = { }
    @reactElement = new React.createElement TeamElement, options

  name: () ->
    @team.name

  apiChannels: () ->
    @connection.client.channels

  addChannel: (channel) ->
    @channels[channel.id] = channel

  channelForName: (name) ->
    channel = (channel for channelId, channel of @apiChannels() when channel.name is name)
    if channel? then channel[0] else null

module.exports = Team
