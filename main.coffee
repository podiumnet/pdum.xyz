app = (express = require 'express')()
app.use express.static 'public'
app.listen process.env.OPENSHIFT_NODEJS_PORT || 8080, process.env.OPENSHIFT_NODEJS_IP || '127.0.0.1', -> console.log "Static Server: Online"
