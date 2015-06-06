Message = React.createClass
  render: ->
    <li className="messageBox">
      <div className="userAvatar">
        <img src={@props.user.profile.image_192} alt={@props.user.name} width=64 height=64 />
      </div>
      {@props.user.name} - {@props.msg.text}
    </li>

module.exports = Message
