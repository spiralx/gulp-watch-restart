
TaskBase = require './task-base'


# ----------------------------------------------------------------------------

class TaskClient extends TaskBase
  @defaults
    port: 9192
    logging: true

  constructor: (options) ->
    @options = extend


module.exports = TaskClient
