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
module.exports = (socket, mysql) ->
  hash = require 'node_hash'

  socket.on 'login', (data) ->
    username = mysql.escape data.username
    estat = mysql.query "SELECT * FROM podium_users
    WHERE username=#{username} LIMIT 1", (rows, fields) ->
      if rows.length > 0
        pwordhash = hash.sha512 data.password, rows[0].password_salt
        if pwordhash is rows[0].password
          socket.session.logged_in = true
          socket.session.user_id = rows[0].id
          socket.emit 'loginSuccess'
        else
          socket.emit 'loginFailed'
      else
        socket.emit 'loginFailed'
    socket.emit 'loginFailed' if !estat

  socket.on 'signup', (data) ->
    username = mysql.escape data.username
    salt = ((Math.random()+Math.random()+1)*10000000000000000).toString(36)
    pwordhash = hash.sha512 data.password, salt
    email = mysql.escape data.email
    if username.length > 20 or not (/^\S+$/.test username)
      socket.emit 'signupFailed',
      'Username can\'t have spaces or tabs, or be empty, or < 20 chars.'
    else if not (/^\S+$/.test data.password)
      socket.emit 'signupFailed',
      'Password can\'t have spaces or tabs, or be empty.'
    else if not (/^\S+$/.test email)
      socket.emit 'signupFailed',
      'Email can\'t have spaces or tabs, or be empty.'
    else
      estat = mysql.query "SELECT * FROM podium_users
      WHERE username = #{username}",
      (rows, fields) ->
        if rows.length > 0
          socket.emit 'signupFailed', 'Username Taken'
        else
          userdata =
            username: data.username
            password: pwordhash
            email: data.email
            password_salt: salt
          estat = mysql.querySet "INSERT INTO podium_users SET ?", userdata,
          (result) ->
            socket.session.logged_in = true
            socket.session.user_id = result.insertId
            socket.emit 'signupSuccess'
          socket.emit 'signupFailed', 'Something Weird Happened' if !estat

      # Error response
      socket.emit 'signupFailed', 'Something Weird Happened' if !estat
