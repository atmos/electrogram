MessageList = React.createClass
  getInitialState: ->
    return { height: "400px" }

  updateDimensions: ->
    console.log "MessageList Resize: height: #{$(window).height()-80}"
    this.setState({height: ($(window).height()-80)})
  componentWillMount: ->
    this.updateDimensions()
  componentDidMount: ->
    window.addEventListener("resize", this.updateDimensions)
  componentWillUnmount: ->
    window.removeEventListener("resize", this.updateDimensions)

  componentWillUpdate: () ->
    if node = @getDOMNode()
      @shouldScrollBottom = (node.scrollTop + node.offsetHeight) > node.scrollHeight-80
  componentDidUpdate: () ->
    if @shouldScrollBottom
      if node = @getDOMNode()
        setTimeout ( ->
          node.scrollTop = node.scrollHeight
        ), 750

  render: ->
    divStyle =
      height: "#{@state.height}px"

    return null if @props.messages == undefined || @props.messages.length == 0
    <div className="messages" style={divStyle}>{@props.messages}</div>

module.exports = MessageList
