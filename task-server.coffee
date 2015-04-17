
WebSocket = require 'ws'
WebSocketServer = WebSocket.Server

TaskBase = require './task-base'


# ----------------------------------------------------------------------------

class TaskServer extends TaskBase

  isActive: ->
    true if @server?

  start: =>
    return if @server?

    @ser`ver = new WebSocketServer(port: @options.port)

    @server
      .on 'connection', (ws) ->
        @log "Connection opened"

        ws.on 'message', (data, flags) ->
          @log "Received: '#{data}'"

        ws.on 'close', ->
          @log "Connection closed"

        # ws.send 'Hi!'

    @log "Listening on port #{port}"

  stop: ->
    return unless @server?

    @log "Stopping server..."

    @server.close()
    @server = null

    @log "Done."


module.exports = TaskServer
