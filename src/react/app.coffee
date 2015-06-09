Input       = require "./input"
Config      = require "../config"
Channel     = require "./channel"
ChannelList = require "./channel_list"
MessageList = require "./message_list"

App = React.createClass
  updateDimensions: ->
    console.log "WINDOWS: width: #{$(window).width()}, height: #{$(window).height()}"
    this.setState({width: $(window).width(), height: $(window).height()})
  componentWillMount: ->
    this.updateDimensions()
  componentDidMount: ->
    window.addEventListener("resize", this.updateDimensions)
  componentWillUnmount: ->
    window.removeEventListener("resize", this.updateDimensions)

  getInitialState: ->
    tokenFile = "#{process.env.HOME}/.peonies.json"
    config = new Config(tokenFile)

    unless config.isValid()
      console.log "WARNING: Your config file #{tokenFile} is invalid"

    return {
      channels: config.channels
      activeChannel: config.channels[0].name
      messages: []
    }

  handleChangeChannel: (selectedChannel) ->
    [teamName, channelName] = selectedChannel.split "#"

    if @props.connections?
      team = (team for team in @props.connections when team.props.team.name is teamName)[0]
      for channelId, info of team.props.connection.client.channels
        if channelName == info .name
          channel = (channel for channel in team.props.channels when channel.key == channelId)[0]

          unless channel?
            channel = new React.createElement Channel, {key: channelId, name: info.name, info: info, team: team, messages: []}
            team.props.channels.push(channel)
          this.setState({ activeChannel: selectedChannel, messages: channel.props.messages })

  render: ->
    <div className="chat">
      <div className="teams-sidebar"></div>
      <div className="team">
        <ChannelList channels={ @state.channels } active={ @state.activeChannel } onChange={ this.handleChangeChannel } />
        <MessageList messages={ @state.messages }, application={@} />
      </div>
    </div>

module.exports = App
