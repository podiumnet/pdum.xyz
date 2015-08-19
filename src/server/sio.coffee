###
Podium - Copyright (C) 2015 Podium Contributors

This file is part of Podium.

Podium is free software: you can redistribute it and/or modify
it under the terms of the GNU General Public License as published by
the Free Software Foundation, either version 3 of the License, or
(at your option) any later version.

Podium is distributed in the hope that it will be useful,
but WITHOUT ANY WARRANTY; without even the implied warranty of
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
GNU General Public License for more details.

You should have received a copy of the GNU General Public License
along with Podium.  If not, see <http://www.gnu.org/licenses/>.
###
module.exports = (http) ->
  console.log  "Initializing Socket.io"
  sessions = require './session_manager'
  io = require('socket.io')(http)

  # When a user connects (loads a new page):
  io.on 'connection', (socket) ->
    give_uniques = ->
      sessionid = sessions.new()
      sess = sessions.sessions[sessionid]
      sess.password = (Math.random()+Math.random()+1).toString(36).substring 7
      socket.emit 'assigned_uniques',
        id: sessionid,
        password: sess.password
    ###
    They need to be verified legitimate to have a
    saved session. The unique session ID and a password,
    randomly generated, are stored in the user's localStorage.
    ###
    socket.on 'verifylegit', (uniques) ->
      sess = sessions.get uniques.id, uniques.password
      if sess
        socket.session = sess
        ###
        If this password has been used more than 10 times,
        we make a new one for security reasons.
        ###
        if sess.meetups > 5
          # Generate a new code in base-36 (lets + nums).
          # We double up the Math.random()s for a bigger number,
          # and add one to the result to prevent a password of 0.
          newcode =
            (Math.random()+Math.random()+1).toString(36).substring 7
          sess.password = newcode
          # The client needs to know the new code.
          socket.emit 'seemslegit', newcode
          sess.meetups = 0
        else
          sess.meetups++
          socket.emit 'seemslegit'
      else
        give_uniques()

    # If the client needs new uniques, we give them some.
    socket.on 'getuniques', ->
      give_uniques()

    socket.on 'isloggedin', ->
      socket.emit 'isloggedin', socket.session.logged_in
