###
Podium - Copyright (C) 2015 Podium

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
  MySQLHandler = require './MySQLHandler'
  mysql = new MySQLHandler()
  accounthandler = require './user_accounts'
  hash = require 'node_hash'

  # When a user connects (loads a new page):
  io.on 'connection', (socket) ->
    accounthandler socket, mysql
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
        socket.emit 'seemslegit'
      else
        give_uniques()

    socket.on 'newpassword', ->
      ###
      We need to regenerate the password for the next use.
      Generate a new code in base-36 (lets + nums).
      We double up the Math.random()s for a bigger number,
      and add one to the result to prevent a password of 0.
      ###
      newcode =
        (Math.random()+Math.random()+1).toString(36).substring 7
      socket.session.password = newcode
      # The client needs to know the new code.
      socket.emit 'newpassword', newcode

    # If the client needs new uniques, we give them some.
    socket.on 'getuniques', ->
      give_uniques()

    socket.on 'isloggedin', ->
      socket.emit 'isloggedin', socket.session.logged_in
