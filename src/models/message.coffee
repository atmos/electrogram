TextMessage  = require "../react/messages/text_message"
ImageMessage = require "../react/messages/image_message"

class Message
  constructor: (@channel, @msg) ->
    @user = @channel.userFor(@msg.user)

    options =
      key: @msg.ts
      msg: @msg
      parent: @

    if @messageType() is "image"
      @reactElement = new React.createElement ImageMessage, options
    else
      @reactElement = new React.createElement TextMessage, options

  body: () ->
    @msg.text

  messageType: () ->
    if @msg.text.match(/^<(.*\.(:?jpg|jpeg|gif|png))>$/)
      "image"
    else
      "text"

module.exports = Message
