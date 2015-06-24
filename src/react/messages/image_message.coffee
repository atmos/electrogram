MessageElement = require "../message"

class ImageMessage extends MessageElement
  getInitialState: ->
    return { width: "800px" }

  updateDimensions: ->
    console.log "Message Resize: max-width: #{($(window).width()-50)}"
    this.setState({width: ($(window).width() - 50)})
  componentWillMount: ->
    this.updateDimensions()
  componentDidMount: ->
    window.addEventListener("resize", this.updateDimensions)
  componentWillUnmount: ->
    window.removeEventListener("resize", this.updateDimensions)

  render: ->
    imgStyle =
      "maxWidth": "#{@state.width- 50}px"
    <div className="message">
      <span className="avatar">
        <img src={ @userAvatarImage() } />
      </span>
      <h4 className="author">{ @userName() }</h4>
      <img className="chat-image" style={imgStyle} src={  @body() } />
    </div>

  body: ->
    @props.parent.body().replace(/^</, '').replace(/>$/, '')

module.exports = ImageMessage
