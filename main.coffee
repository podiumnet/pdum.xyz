app = (express = require 'express')()
app.use express.static 'public'
app.listen 8080, -> console.log "Static Server: Online"
