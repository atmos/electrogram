Fs = require 'fs'
React = require 'react'
SlackConnection = require './slack_connection'

tokenFile = "#{process.env.HOME}/.peonies.json"

Fs.readFile tokenFile, (err, data) ->
  throw err if err
  tokens = JSON.parse(data)
  new SlackConnection(token, document) for token in tokens
