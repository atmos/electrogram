AttachmentElement = require "../attachment"

class TwitterAttachment extends AttachmentElement
  render: ->
    <div className="message has-attachment">
      <div className="attachment">
        <a href={@props.attachment.author_link} className="external" target="_blank">
          <img src={ @props.attachment.author_icon } className="mini-avatar" />
        </a>
        <h3>
          <a href={@props.attachment.author_link} className="external" target="_blank">
            <span className="twitter-name">{ @props.attachment.author_name }</span>
            <span className="twitter-handle">{ @props.attachment.author_subname }</span>
          </a>
        </h3>
        <div className="content text" dangerouslySetInnerHTML={{__html: @slackify(@props.attachment.text)}}/>

        { @props.attachment.image_url &&
          <a href={@props.attachment.author_link} className="external" target="_blank">
            <img className="chat-image" src={ @props.attachment.image_url } />
          </a>
        }
      </div>
    </div>

module.exports = TwitterAttachment
