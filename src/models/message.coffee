Fs = require "fs"

MessageElement = require "../react/message"

class Message
  constructor: (@channel, @msg) ->
    options =
      key: @id
      msg: @msg
      channel: @channel
      parent: @channel

    @reactElement = new React.createElement MessageElement, options
