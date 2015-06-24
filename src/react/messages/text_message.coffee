MessageElement = require "../message"

class TextMessage extends MessageElement
  render: ->
    <div className="message">
      <span className="avatar">
        <img src={ @userAvatarImage() } />
      </span>
      <h4 className="author">{ @userName() }</h4>
      <div className="content text">{ @body() }</div>
    </div>

  body: () ->
    @emojify(@props.parent.body())

module.exports = TextMessage
