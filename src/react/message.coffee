ReactEmoji    = require "react-emoji"

Message = React.createClass
  getInitialState: ->
    return { width: "800px" }

  updateDimensions: ->
    @setState({width: ($(window).width() - 50)})

  mixins: [ ReactEmoji ]

  render: ->
    <div className="message">
      <img src={ @userAvatarImage() } className="avatar" />
      <h4 className="author">{ @userName() }</h4>
      <div className="content text" dangerouslySetInnerHTML={{__html: @body()}}/>
    </div>

  userName: ->
    @props.parent.user.name

  userAvatarImage: ->
    @props.parent.user.profile.image_192

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

module.exports = Message
