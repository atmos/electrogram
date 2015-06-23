Config       = require "../config"
Channel      = require "./channel"
ChannelList  = require "./channel_list"
MessageList  = require "./message_list"

AppElement = React.createClass
  getInitialState: ->
    tokenFile = "#{process.env.HOME}/.electrogram.json"
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

    if @props.parent?
      team = @props.parent.teamForName(teamName)
      if team?
        for channelId, info of team.apiChannels()
          if channelName == info.name
            channel = team.channelForNameOrId(channelName, channelId)

            unless channel?
              channel = new Channel(team, channelId)
              team.addChannel(channel)

            this.setState({ activeChannel: selectedChannel, messages: channel.reactMessages() })

  render: ->
    <div className="chat">
      <div className="teams-sidebar"></div>
      <div className="team">
        <ChannelList channels={ @state.channels } active={ @state.activeChannel } onChange={ this.handleChangeChannel } />
        <MessageList messages={ @state.messages }, application={@} />
      </div>
    </div>

module.exports = AppElement
