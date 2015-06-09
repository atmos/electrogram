MessageList = React.createClass
  getInitialState: ->
    return { height: "400px" }

  updateDimensions: ->
    console.log "MessageList Resize: height: #{$(window).height()-70}"
    this.setState({width: ($(window).width()-20), height: ($(window).height()-70)})
  componentWillMount: ->
    this.updateDimensions()
  componentDidMount: ->
    window.addEventListener("resize", this.updateDimensions)
  componentWillUnmount: ->
    window.removeEventListener("resize", this.updateDimensions)

  componentWillUpdate: () ->
    if node = @getDOMNode()
      @shouldScrollBottom = (node.scrollTop + node.offsetHeight) > node.scrollHeight-70
  componentDidUpdate: () ->
    if @shouldScrollBottom
      if node = @getDOMNode()
        setTimeout ( ->
          node.scrollTop = node.scrollHeight
        ), 750

  render: ->
    divStyle =
      width: "#{@state.width}px"
      height: "#{@state.height}px"

    return null if @props.messages == undefined || @props.messages.length == 0
    <div className="messages" style={divStyle}>{@props.messages}</div>

module.exports = MessageList
