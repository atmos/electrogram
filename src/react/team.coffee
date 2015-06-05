Team = React.createClass
  render: ->
    <div className="team">
      {@props.team.name}'s Slack chat.
      <ul className="teamMessages">
        {@props.messages}
      </ul>
    </div>

module.exports = Team
