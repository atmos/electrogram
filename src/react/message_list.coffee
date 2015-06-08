MessageList = React.createClass
  render: ->
    return null if @props.messages == undefined || @props.messages.length == 0
    <div className="messages">
      { @props.messages.map (message) ->
        <div className="message">
          <span className="avatar">
            <img src={ message.props.user.profile.image_192 } />
          </span>
          <h4 className="author">{ message.props.user.name }</h4>
          <div className="content text">{ message.props.msg.text }</div>
        </div>
      }
    </div>

module.exports = MessageList
