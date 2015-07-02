Attachment = React.createClass
  getInitialState: ->
    return { width: "800px" }

  updateDimensions: ->
    @setState({width: ($(window).width() - 50)})

  render: ->
    <div className="message has-attachment">
      <div className="attachment">
        <h4>{ @props.attachment.service_name }</h4>
        <h3>{ @props.attachment.author_name }</h3>
        <h2><a href={@props.attachment.title_link} className="external" target="_blank">{@props.attachment.title}</a></h2>
        <p>{ @props.attachment.text }</p>
        { (@props.attachment.image_url || @props.attachment.thumb_url) &&
          <a href={@props.attachment.title_link} className="external" target="_blank">
            <img className="chat-image" src={ @props.attachment.image_url or @props.attachment.thumb_url } />
          </a>
        }
      </div>
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
