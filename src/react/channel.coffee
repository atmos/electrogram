Channel = React.createClass
  render: ->
    <div className="channel">
      <span>{@props.name}</span>
      <ul id="messages-list">{@props.messages}</ul>
    </div>

module.exports = Channel
