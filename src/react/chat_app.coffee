ChatApp = React.createClass
  render: ->
    <div className="chat">
      <section id="main">
        <ul id="teams-list">{@props.connections}</ul>
      </section>
    </div>

module.exports = ChatApp
