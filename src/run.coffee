Fs = require 'fs'
React = require 'react'
SlackConnection = require './slack_connection'

tokenFile = "#{process.env.HOME}/.peonies.json"

Fs.readFile tokenFile, (err, data) ->
  throw err if err
  tokens = JSON.parse(data)
  for token in tokens
    connection = new SlackConnection(token, document)
    connection.on "login", (conn, user, team) ->
      $("#messages").append("<li>#{user.name} joined #{team.name}'s Slack chat.</li>")
    connection.on "message", (conn, msg) ->
      if msg.type == 'message'
        item = "<li>#{msg._client.team.name} / #{msg.channel} / #{msg.user} - #{msg.text}</li>"
        $("#messages").append(item)
      else
        console.log "Unknown message type, #{msg.type}"
