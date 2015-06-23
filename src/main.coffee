require "coffee-react/register"

Fs           = require "fs"
App          = require "./models/app"
InputElement = require "./react/input"

app = new App(document)
app.setup()

setTimeout ( ->
  inputBar = React.createElement InputElement, {key: "input-bar-1", app: app}
  React.render inputBar, document.getElementById("input-bar")

  React.render app.reactElement, document.getElementById("chat-app")
), 500

