MessageElement = require "../message"

class TextMessage extends MessageElement

  render: ->
    <div className="message">
      <span className="avatar">
        <img src={ @userAvatarImage() } />
      </span>
      <h4 className="author">{ @userName() }</h4>
      <div className="content text" dangerouslySetInnerHTML={{__html: @body()}}/>
    </div>

  body: () ->
    @emojify(@slackify(@props.parent.body()))

  slackify: (text) ->
    loop
      match = text.match(/\<((?!a href|\/a).+?)\>/)
      break unless match

      [target, readableName] = match[1].split(/\|/)
      readableName ?= target

      text = text.replace match[0], "<a href=\"#{target}\" class=\"external\" target=\"_blank\">#{readableName}</a>"
    text


module.exports = TextMessage
