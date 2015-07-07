Input = React.createClass
  getInitialState: ->
    return { value: "" }

  handleChange: (event) ->
    @setState({ value: event.target.value })

  appConnections: () ->
    @props.application.props.parent.connections

  channelForKey: (key) ->
    [teamName, channelName] = key.split "#"

    if @props.application?
      team = @props.application.props.parent.teamForName(teamName)
      if team?
        for channelId, info of team.apiChannels()
          if channelName == info.name
            return team.apiChannels()[channelId]
    return null

  handleSubmit: (event) ->
    event.preventDefault()
    channel = @channelForKey(@props.application.state.activeChannel)
    console.log "YASSS: #{@state.value}"
    message = channel.send(@state.value)
    channel._client.onMessage message
    @setState(value: "")

  render: ->
    <form className="message-input-form" onSubmit={@handleSubmit}>
      <input type="text" value={@state.value} onChange={@handleChange} placeholder="Write something…" className="message-input" />
    </form>

module.exports = Input
