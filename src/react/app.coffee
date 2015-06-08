Channel     = require './channel'
ChannelList = require "./channel_list"
MessageList = require "./message_list"

App = React.createClass
  getInitialState: ->
    return {
      channels: [
        { name: "Zero Fucks LTD#general" }
        { name: "Zero Fucks LTD#atmos-hubot" }
        { name: "lstoll#general2" }
      ]

      activeChannel: "Zero Fucks LTD#general"

      messages: []
    }

  handleChangeChannel: (channel) ->
    [teamName, channelName] = channel.split "#"

    if @props.connections?
      team = (team for team in @props.connections when team.props.team.name is teamName)[0]
      for channelId, info of team.props.connection.client.channels
        if channelName == info .name
          channel = (channel for channel in team.props.channels when channel.key == channelId)[0]

          unless channel?
            channel = new React.createElement Channel, {key: channelId, name: info.name, info: info, team: team, messages: []}
            team.props.channels.push(channel)
          this.setState({ activeChannel: channel, messages: channel.props.messages })

  render: ->
    <div className="chat">
      <div className="teams-sidebar">
      </div>
      <div className="team">
        <ChannelList channels={ @state.channels } active={ @state.activeChannel } onChange={ this.handleChangeChannel } />
        <MessageList messages={ @state.messages } />
      </div>
    </div>

module.exports = App
