module.exports = (maindir)->
  express = require 'express'
  app = express()
  environment = require './environment'

  app.use express.static "#{maindir}/web"
  app.use express.static "#{maindir}/compiled/browser"

  server = app.listen environment.port, environment.ip, ->

    console.log 'PODIUM SERVER Listening @ %s:%s', environment.ip,
      environment.port
