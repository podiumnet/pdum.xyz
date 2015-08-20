
/*
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
 */

(function() {
  module.exports = function(socket, mysql) {
    var hash, hashPassword;
    hash = require('node_hash');
    hashPassword = function(password) {};
    socket.on('login', function(data) {
      var err, username;
      username = mysql.escape(data.username);
      try {
        return mysql.query("SELECT * FROM podium_users WHERE username='" + username + "' LIMIT 1", function(rows, fields) {
          var pwordhash;
          if (rows.length > 0) {
            pwordhash = hash.sha512(data.password, rows.password_salt);
            if (pwordhash === rows.password) {
              socket.session.logged_in = true;
              socket.session.user_id = rows[0].id;
              return socket.emit('loginSuccess');
            } else {
              return socket.emit('loginFailed');
            }
          } else {
            return socket.emit('loginFailed');
          }
        });
      } catch (_error) {
        err = _error;
        return socket.emit('loginFailed');
      }
    });
    return socket.on('signup', function(data) {
      var email, err, pwordhash, salt, username;
      username = mysql.escape(data.username);
      salt = ((Math.random() + Math.random() + 1) * 10000000000000000).toString(36).substring(7);
      pwordhash = hash.sha512(data.password, salt);
      email = mysql.escape(data.email);
      if (username.length > 20 || !(/^[a-zA-Z0-9]+$/.test(username))) {
        return socket.emit('signupFailed', 'Username must be letters and numbers, non-empty, < 20 chars.');
      } else if (!(/^\S+$/.test(password))) {
        return socket.emit('signupFailed', 'Password can\'t have spaces or tabs, or be empty.');
      } else if (!(/^\S+$/.test(email))) {
        return socket.emit('signupFailed', 'Email can\'t have spaces or tabs, or be empty.');
      } else {
        try {
          return mysql.query("SELECT * FROM podium_users WHERE username='" + username + "' LIMIT 1", function(rows, fields) {
            var userdata;
            if (rows.length > 0) {
              return socket.emit('signupFailed', 'Username Taken');
            } else {
              userdata = {
                username: username,
                password: pwordhash,
                email: email,
                password_salt: salt
              };
              return mysql.querySet("INSERT INTO podium_users SET ?", userdata, function(result) {
                return socket.emit('signupSuccess', result.insertId);
              });
            }
          });
        } catch (_error) {
          err = _error;
          return socket.emit('signupFailed', 'Something Weird Happened');
        }
      }
    });
  };

}).call(this);

//# sourceMappingURL=../../maps/user_accounts.js.map
