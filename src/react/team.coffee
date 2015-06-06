Team = React.createClass
  render: ->
    <div className="team">
      <span className="team-title">{@props.team.name}</span>
      <ul className="teamChannels">
        {@props.channels}
      </ul>
    </div>

module.exports = Team
