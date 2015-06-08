Config = require "../src/config"

describe "Config", () ->
  it "validates configs", () ->
    config = new Config(__dirname + "/fixtures/good_config1.json")
    assert.equal true, config.isValid()
    assert.equal 1, config.data.rooms.length
    assert.equal 3, config.data.tokens.length

  it "is invalid on missing tokens", () ->
    config = new Config(__dirname + "/fixtures/bad_config_missing_tokens.json")
    assert.equal false, config.isValid()

  it "is invalid on missing rooms", () ->
    config = new Config(__dirname + "/fixtures/bad_config_missing_rooms.json")
    assert.equal false, config.isValid()

  it "is invalid on JSON parse errors", () ->
    config = new Config(__dirname + "/fixtures/bad_config_parse_err.json")
    assert.equal false, config.isValid()
