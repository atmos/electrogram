TextMessage  = require "../react/messages/text_message"
ImageMessage = require "../react/messages/image_message"

class Message
  constructor: (@channel, @msg) ->
    @user = @channel.userFor(@msg.user)

    options =
      key: @msg.ts
      msg: @msg
      parent: @

    switch @messageType()
      when "image"
        @reactElement = new React.createElement ImageMessage, options
      when "attachment"
        null
        debugger
      else
        @reactElement = new React.createElement TextMessage, options

  body: () ->
    @msg.text

  messageType: () ->
    if @msg.attachments?
      return "attachment"
    else if @msg.text.match(/^<(.*\.(:?jpg|jpeg|gif|png))>$/)
      "image"
    else
      "text"

module.exports = Message
