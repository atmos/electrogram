Fs = require "fs"

class Config
  constructor: (@filename) ->
    try
      data = Fs.readFileSync @filename, encoding: 'utf8'
      @data = JSON.parse(data)
      @tokens = @data.tokens
      @channels = @data.channels
    catch error
      console.log "Error parsing config file: #{error}"
      @data = { }

  isValid: ->
    @data and
      (@data.tokens? and @data.tokens.length > 0) and
      (@data.channels? and @data.channels.length > 0)


module.exports = Config
