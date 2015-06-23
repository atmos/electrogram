# Cakefile

{exec} = require "child_process"

REPORTER = "min"

task "test", "run tests", ->
  exec "NODE_ENV=test ./node_modules/.bin/mocha", (err, output) ->
    throw err if err
    console.log output
  exec "NODE_ENV=test ./node_modules/.bin/coffeelint -f .coffeelint.json src/*.coffee", (err, output) ->
    throw err if err
    console.log output
  exec "NODE_ENV=test ./node_modules/.bin/coffeelint -f .coffeelint.json src/models/*.coffee", (err, output) ->
    throw err if err
    console.log output
