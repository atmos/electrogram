Team = React.createClass
  render: ->
    <div className="team">
      {@props.team.name}'s Slack chat.
      <ul className="teamChannels">
        {@props.channels}
      </ul>
    </div>

module.exports = Team
