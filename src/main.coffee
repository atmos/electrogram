require "coffee-react/register"

Fs           = require "fs"
App          = require "./models/app"

app = new App(document)
app.setup()

setTimeout ( ->
  React.render app.reactElement, document.getElementById("chat-app")
), 500
