Fs = require "fs"

class Config
  constructor: (@filename) ->
    try
      data = Fs.readFileSync @filename, encoding: 'utf8'
      @data = JSON.parse(data)
    catch error
      console.log "Error parsing config file: #{error}"
      @data = { }

  isValid: ->
    @data and
      (@data.rooms? and @data.rooms.length > 0) and
      (@data.tokens? and @data.tokens.length > 0)


module.exports = Config
