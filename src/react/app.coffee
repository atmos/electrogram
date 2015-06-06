App = React.createClass
  render: ->
    <div className="chat">
      <ul id="teams-list">{@props.connections}</ul>
    </div>

module.exports = App
