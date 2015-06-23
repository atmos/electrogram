SlackClient  = require 'slack-client-atmos'
EventEmitter = require 'events'

class SlackConnection extends EventEmitter
  constructor: (@token, @document) ->
    @client = new SlackClient @token, true, false

    @client.on 'open', @.open
    @client.on 'close', @.close
    @client.on 'error', @.error
    @client.on 'message', @.message
    @client.on 'loggedIn', @.login

    @client.login()

  open: =>
    @emit "open", @

  close: =>
    @emit "close", @

  error: (error) ->
    console.log "Received error #{JSON.stringify error}"
    console.log error.stack
    console.log "Exiting in 1 second"
    setTimeout process.exit.bind(process, 1), 1000

  login: (self, team) =>
    @emit "login", @, self, team

  message: (msg) =>
    @emit "message", @, msg

# Export class for unit tests
module.exports = SlackConnection
