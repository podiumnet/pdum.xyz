boundlogins = []
loggedin_gotten = false
window.bindLoginStatus = (callback) ->
  callback() if loggedin_gotten
  boundlogins.push callback

socket.on 'isloggedin', (loggedin) ->
  console.log "Recieved logged-in status: #{loggedin}."
  window.logged_in = loggedin
  loggedin_gotten = true
  for func of boundlogins
    boundlogins[func]()

bindVerify ->
  socket.emit 'isloggedin'
