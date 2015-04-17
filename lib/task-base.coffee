
{ extend } = require './utils'


# ----------------------------------------------------------------------------

class TaskBase
  @defaults:
    port: 9192
    logging: true

  constructor: (options) ->
    @options = extend @defaults, options

  log: (message) ->
    console.log message if @options.logging


module.exports = TaskBase
