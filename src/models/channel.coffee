Message = require "./message"
ChannelElement = require "../react/channel"

class Channel
  constructor: (@team, @id) ->
    options =
      key: @id
      parent: @team

    @messages = [ ]
    @reactElement = new React.createElement ChannelElement, options

  name: () ->
    @team.name()

  userFor: (name) ->
    @team.connection.client.users[name]

  reactMessages: () ->
    (message.reactElement for message in @messages)

  addMessage: (msg) ->
    message = new Message(@, msg)
    @messages.shift() if @messages.length > 250
    @messages.push(message)

module.exports = Channel
