ReactEmoji    = require "react-emoji"

Message = React.createClass
  getInitialState: ->
    return { width: "800px" }

  updateDimensions: ->
    this.setState({width: ($(window).width() - 50)})

  mixins: [ ReactEmoji ]

  render: ->
    <div className="message">
      <span className="avatar">
        <img src={ @userAvatarImage() } />
      </span>
      <h4 className="author">{ @userName() }</h4>
      <div className="content text">Unknown messageType</div>
    </div>

  userName: ->
    @props.parent.user.name

  userAvatarImage: ->
    @props.parent.user.profile.image_192

module.exports = Message
