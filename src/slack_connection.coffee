SlackClient = require 'slack-client'

class SlackConnection
  constructor: (@token) ->
    @client = new SlackClient @token, true, true

    @client.on 'error', @.error
    @client.on 'loggedIn', @.loggedIn
    @client.on 'open', @.open
    @client.on 'close', @.clientClose
    @client.on 'message', @.message
    @client.on 'userChange', @.userChange

    @client.login()

  error: (error) =>
    console.log "Received error #{JSON.stringify error}"
    console.log error.stack
    console.log "Exiting in 1 second"
    setTimeout process.exit.bind(process, 1), 1000

  loggedIn: (self, team) =>
    console.log "Logged in as #{self.name} of #{team.name}, but not yet connected"

    # store a copy of our own user data
    @self = self

  open: =>
    console.log 'Slack client now connected'

  clientClose: =>
    # Don't actually do anything since we may reconnect in the future
    console.log 'Slack client closed, waiting for reconnect'

  message: (msg) =>
    # Ignore our own messages
    return if msg.user == @self.id
    console.log msg.text

  userChange: (user) =>

# Export class for unit tests
module.exports = SlackConnection
