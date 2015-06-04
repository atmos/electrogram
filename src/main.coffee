Fs = require 'fs'
App = require 'app'
BrowserWindow = require 'browser-window'
SlackConnection = require './slack_connection'

mainWindow = null

App.on 'window-all-closed', () ->
  app.quit() unless process.platform == 'darwin'

App.on 'ready', ->
  mainWindow = new BrowserWindow(width: 800, height: 600)

  mainWindow.loadUrl "file://#{__dirname}/../templates/main.html"
  mainWindow.openDevTools()

  # Emitted when the window is closed.
  mainWindow.on 'closed', () ->
    # Dereference the window object, usually you would store windows
    # in an array if your app supports multi windows, this is the time
    # when you should delete the corresponding element.
    mainWindow = null

  tokenFile = "#{process.env.HOME}/.peonies.json"

  Fs.readFile tokenFile, (err, data) ->
    throw err if err
    tokens = JSON.parse(data)
    new SlackConnection(token) for token in tokens
