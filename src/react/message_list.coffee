MessageList = React.createClass
  render: ->
    return null if @props.messages == undefined || @props.messages.length == 0
    <div className="messages">{@props.messages}</div>

module.exports = MessageList
