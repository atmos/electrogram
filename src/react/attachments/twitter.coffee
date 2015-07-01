AttachmentElement = require "../attachment"

class TwitterAttachment extends AttachmentElement
  render: ->
    imgStyle =
      "maxWidth": "#{@state.width- 50}px"
    <div className="message attachment">
      <span className="mini-avatar">
        <img src={ @props.attachment.author_icon } />
      </span>
      <h4>{ @props.attachment.author_name }</h4>
      <div className="content text" dangerouslySetInnerHTML={{__html: @slackify(@props.attachment.text)}}/>
      <img className="chat-image" style={imgStyle} src={ @props.attachment.image_url } />
    </div>

module.exports = TwitterAttachment
