Message = require "./message"
AttachmentElement        = require "../react/attachment"
TwitterAttachmentElement = require "../react/attachments/twitter"
YouTubeAttachmentElement = require "../react/attachments/youtube"

class Attachment
  constructor: (@msg, @attachment, index) ->
    options =
      key: "#{@msg.ts}-attachment-#{index}"
      msg: @msg
      parent: @
      channel: @msg.channel
      attachment: @attachment

    @reactElement = @createReactElement(options)

  createReactElement: (options) ->
    switch @attachment.service_name
      when "twitter"
        new React.createElement TwitterAttachmentElement, options
      when "YouTube"
        new React.createElement YouTubeAttachmentElement, options
      else
        console.log @attachment
        console.log "Uncustomized attachment:> #{@attachment.service_name}"
        new React.createElement AttachmentElement, options

module.exports = Attachment
