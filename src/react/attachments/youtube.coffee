AttachmentElement = require "../attachment"

class YouTubeAttachment extends AttachmentElement
  render: ->
    <div className="message has-attachment">
      <div className="attachment">
        <h4>{ @props.attachment.service_name }</h4>
        <h3>{ @props.attachment.author_name }</h3>
        <h2><a href={@props.attachment.title_link} className="external" target="_blank">{@props.attachment.title}</a></h2>
        <div dangerouslySetInnerHTML={{__html: @props.attachment.video_html }} />
      </div>
    </div>

module.exports = YouTubeAttachment
