Message = React.createClass
  render: ->
    <li className="messageBox">
      {@props.user.name} - {@props.msg.text}
    </li>

module.exports = Message
