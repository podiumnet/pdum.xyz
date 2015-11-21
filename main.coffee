app = (express = require 'express')()
pkg = require './package.json'
if pkg.halfmast
  app.use (req, res) ->
    res.send """
    <!DOCTYPE html>
    <html>
      <head>
        <meta charset="utf-8">
        <title>Podium</title>
        <style>
          body {
            background: #000;
            color: #fff;
            text-align: center;
            margin: 3em;
            font-family: sans-serif;
          }
        </style>
      </head>
      <body>
        <h1>#{pkg.halfmast}</h1>
      </body>
    </html>
    """
else app.use express.static 'public'
app.listen process.env.OPENSHIFT_NODEJS_PORT || 8080, process.env.OPENSHIFT_NODEJS_IP || '127.0.0.1', -> console.log "Static Server: Online"
