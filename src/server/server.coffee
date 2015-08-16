module.exports = (maindir)->
  express = require 'express'
  app = express()
  environment = require './environment'

  app.use (req, res, next) ->
    res.header "Access-Control-Allow-Origin", "*"
    res.header 'Access-Control-Allow-Credentials', true
    res.header 'Access-Control-Allow-Methods', 'POST, GET, PUT, DELETE, OPTIONS'
    res.header 'Access-Control-Allow-Headers', 'Content-Type'
    next()

  app.use express.static "#{maindir}/web"
  app.use express.static "#{maindir}/compiled/browser"

  server = app.listen environment.port, environment.ip, ->

    console.log 'PODIUM SERVER Listening @ %s:%s', environment.ip,
      environment.port
