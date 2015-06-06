Message = React.createClass
  render: ->
    <li className="messageBox">
      {@props.msg.user} - {@props.msg.text}
    </li>

module.exports = Message
