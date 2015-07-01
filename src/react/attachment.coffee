Attachment = React.createClass
  getInitialState: ->
    return { width: "800px" }

  updateDimensions: ->
    this.setState({width: ($(window).width() - 50)})

  render: ->
    imgStyle =
      "maxWidth": "#{@state.width- 50}px"
    <div className="message attachment">
      <h4>{ @props.attachment.service_name }</h4>
      <h3>{ @props.attachment.author_name }</h3>
      <h2><a href={@props.attachment.title_link} className="external" target="_blank">{@props.attachment.title}</a></h2>
      <img className="chat-image" style={imgStyle} src={ @props.attachment.image_url } />
    </div>

  slackify: (text) ->
    loop
      match = text.match(/\<((?!a href|\/a).+?)\>/)
      break unless match

      [target, readableName] = match[1].split(/\|/)
      readableName ?= target

      text = text.replace match[0], "<a href=\"#{target}\" class=\"external\" target=\"_blank\">#{readableName}</a>"
    text

module.exports = Attachment
