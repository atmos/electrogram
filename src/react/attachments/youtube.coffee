AttachmentElement = require "../attachment"

class YouTubeAttachment extends AttachmentElement
  render: ->
    imgStyle =
      "maxWidth": "#{@state.width- 50}px"
    <div className="message attachment">
      <h4>{ @props.attachment.service_name }</h4>
      <h3>{ @props.attachment.author_name }</h3>
      <h2><a href={@props.attachment.title_link} className="external" target="_blank">{@props.attachment.title}</a></h2>
      <img className="chat-image" style={imgStyle} src={ @props.attachment.thumb_url } />
    </div>

module.exports = YouTubeAttachment
