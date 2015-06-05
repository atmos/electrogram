Message = React.createClass
  render: ->
    <li className="messageBox">
      {@props.msg._client.team.name} / #{@props.msg.channel} / #{@props.msg.user} - #{@props.msg.text}
    </li>

module.exports = Message
