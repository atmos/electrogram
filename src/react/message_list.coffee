MessageList = React.createClass
  getInitialState: ->
    return { height: "400px" }

  updateDimensions: ->
    @setState({width: ($(window).width()-20), height: ($(window).height()-70)})
  componentWillMount: ->
    @updateDimensions()
  componentDidMount: ->
    window.addEventListener("resize", @updateDimensions)
  componentWillUnmount: ->
    window.removeEventListener("resize", @updateDimensions)

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
