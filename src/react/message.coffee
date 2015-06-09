ReactEmoji    = require "react-emoji"
ReactAutolink = require "react-autolink"

Message = React.createClass
  mixins: [ ReactEmoji, ReactAutolink ]

  render: ->
    if @props.msg.text.match(/^<(.*\.(:?jpg|jpeg|gif|png))>$/)
      <div className="message">
        <span className="avatar">
          <img src={ @props.user.profile.image_192 } />
        </span>
        <h4 className="author">{ @props.user.name }</h4>
        <img className="chat-image" src={ @props.msg.text.replace(/^</, '').replace(/>$/, '') } />
      </div>
    else
      <div className="message">
        <span className="avatar">
          <img src={ @props.user.profile.image_192 } />
        </span>
        <h4 className="author">{ @props.user.name }</h4>
        <div className="content text">{ @emojify(@props.msg.text) }</div>
      </div>

module.exports = Message
