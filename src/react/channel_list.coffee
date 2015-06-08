ChannelList = React.createClass
  handleChange: (channelName) ->
    @props.onChange(channelName)

  render: ->
    return null if @props.channels == undefined || @props.channels.length == 0
    component = this
    <ul className="channels">
      { @props.channels.map (channel) ->
        klass = ""
        klass += "active" if component.props.active == channel.name
        <li key={ channel.name } onClick={ component.handleChange.bind(component, channel.name ) } className={ klass }>{ channel.alias || channel.name }</li>
      }
    </ul>

module.exports = ChannelList
