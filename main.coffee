app = (express = require 'express')()
app.use express.static 'public'
app.listen process.env.OPENSHIFT_NODJES_PORT || 8080, process.env.OPENSHIFT_NODEJS_IP || "localhost", -> console.log "Static Server: Online"
