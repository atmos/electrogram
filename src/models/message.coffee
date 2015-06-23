Fs = require "fs"

MessageElement = require "../react/message"

class Message
  constructor: (@channel, @msg) ->
    options =
      key: @msg.ts
      msg: @msg
      user: @channel.team.connection.client.users[@msg.user]
      channel: @channel
      parent: @channel

    @reactElement = new React.createElement MessageElement, options

module.exports = Message
