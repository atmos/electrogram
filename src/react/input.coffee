Input = React.createClass
  getInitialState: ->
    return { value: "" }

  handleChange: (event) ->
    @setState({ value: event.target.value })

  handleSubmit: (event) ->
    event.preventDefault()
    console.log "YASSS: #{@state.value}"

  render: ->
    <div className="text-input-area">
      <form className="input-box-form" onSubmit={@handleSubmit}>
        <label className="input-box-label"></label>
        <input type="text" value={@state.value} onChange={@handleChange} />
      </form>
    </div>

module.exports = Input
