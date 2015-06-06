Message = React.createClass
  render: ->
    <li className="messageBox">
      {@props.msg._client.team.name} / {@props.channel.props.name} / #{@props.msg.user} - #{@props.msg.text}
    </li>

module.exports = Message
