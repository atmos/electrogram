Message = React.createClass
  render: ->
    <div className="message">
      <span className="avatar">
        <img src={ @props.user.profile.image_192 } />
      </span>
      <h4 className="author">{ @props.user.name }</h4>
      <div className="content text">{ @props.msg.text }</div>
    </div>

module.exports = Message
