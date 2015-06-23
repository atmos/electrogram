App = require 'app'
BrowserWindow = require 'browser-window'

mainWindow = null

App.on 'window-all-closed', () ->
  app.quit() unless process.platform == 'darwin'

App.on 'ready', ->
  mainWindow = new BrowserWindow(width: 800, height: 600)
  mainWindow.loadUrl "file://#{__dirname}/../templates/main.html"

  if process.env.DEBUG is 'true'
    mainWindow.openDevTools()

  # Emitted when the window is closed.
  mainWindow.on 'closed', () ->
    # Dereference the window object, usually you would store windows
    # in an array if your app supports multi windows, this is the time
    # when you should delete the corresponding element.
    mainWindow = null
