Fs = require 'fs'
React = require 'react'
SlackConnection = require './slack_connection'

tokenFile = "#{process.env.HOME}/.peonies.json"

Fs.readFile tokenFile, (err, data) ->
  throw err if err
  tokens = JSON.parse(data)
  for token in tokens
    connection = new SlackConnection(token, document)
    connection.on "loggedIn", (user, team) ->
      $("#messages").append("<li>Joined #{team.name}'s Slack chat.</li>")
