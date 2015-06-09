SlackClient  = require 'slack-client'
EventEmitter = require 'events'

class SlackConnection extends EventEmitter
  constructor: (@token, @document) ->
    @client = new SlackClient @token, true, true

    @client.on 'open', @.open
    @client.on 'close', @.close
    @client.on 'error', @.error
    @client.on 'message', @.message
    @client.on 'loggedIn', @.login
    @client.on 'userChange', @.userChange

    @client.login()

  open: =>
    @emit "open", @

  close: =>
    @emit "close", @

  error: (error) =>
    console.log "Received error #{JSON.stringify error}"
    console.log error.stack
    console.log "Exiting in 1 second"
    setTimeout process.exit.bind(process, 1), 1000

  login: (self, team) =>
    @emit "login", @, self, team
    console.log @client.channels[0]
    for k of @client.channels
      chan = @client.channels[k]
      chan.fetchHistory()

  message: (msg) =>
    @emit "message", @, msg

  userChange: (user) =>

# Export class for unit tests
module.exports = SlackConnection
