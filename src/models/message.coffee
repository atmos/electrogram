MessageElement = require "../react/message"

class Message
  constructor: (@channel, @msg) ->
    @user = @channel.userFor(@msg.user)

    options =
      key: @msg.ts
      msg: @msg
      parent: @

    @reactElement = new React.createElement MessageElement, options

  body: () ->
    @msg.text

module.exports = Message
