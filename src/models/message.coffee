MessageElement = require "../react/message"

class Message
  constructor: (@channel, @msg) ->
    options =
      key: @msg.ts
      msg: @msg
      user: @channel.userFor(@msg.user)
      parent: @channel

    @reactElement = new React.createElement MessageElement, options

module.exports = Message
