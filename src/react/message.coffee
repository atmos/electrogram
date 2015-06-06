Message = React.createClass
  render: ->
    <li className="messageBox">
      {@props.channel.props.name} / #{@props.msg.user} - #{@props.msg.text}
    </li>

module.exports = Message
