AttachmentElement = require "../attachment"

class SoundCloudAttachment extends AttachmentElement
  render: ->
    <div className="message has-attachment">
      <div className="attachment">
        <h4>{ @props.attachment.service_name }</h4>
        <h3>{ @props.attachment.author_name }</h3>
        <h2><a href={@props.attachment.title_link} className="external" target="_blank">{@props.attachment.title}</a></h2>
        <p className="content text" dangerouslySetInnerHTML={{__html: @slackify(@props.attachment.text)}} />
        <div dangerouslySetInnerHTML={{__html: @props.attachment.audio_html }} />
      </div>
    </div>

module.exports = SoundCloudAttachment
