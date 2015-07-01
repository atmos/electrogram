TextMessage  = require "../react/messages/text_message"
ImageMessage = require "../react/messages/image_message"

class Message
  constructor: (@channel, @msg) ->
    @user = @channel.userFor(@msg.user)

    options =
      key: @msg.ts
      msg: @msg
      parent: @

    @reactElement = new React.createElement TextMessage, options

  body: () ->
    @msg.text

module.exports = Message
