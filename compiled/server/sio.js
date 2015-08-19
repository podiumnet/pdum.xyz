
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
  module.exports = function(http) {
    var io, sessions;
    console.log("Initializing Socket.io");
    sessions = require('./session_manager');
    io = require('socket.io')(http);
    return io.on('connection', function(socket) {
      var give_uniques;
      give_uniques = function() {
        var sess, sessionid;
        sessionid = sessions["new"]();
        sess = sessions.sessions[sessionid];
        sess.password = (Math.random() + Math.random() + 1).toString(36).substring(7);
        return socket.emit('assigned_uniques', {
          id: sessionid,
          password: sess.password
        });
      };

      /*
      They need to be verified legitimate to have a
      saved session. The unique session ID and a password,
      randomly generated, are stored in the user's localStorage.
       */
      socket.on('verifylegit', function(uniques) {
        var sess;
        sess = sessions.get(uniques.id, uniques.password);
        if (sess) {
          socket.session = sess;
          return socket.emit('seemslegit');
        } else {
          return give_uniques();
        }
      });
      socket.on('newpassword', function() {

        /*
        We need to regenerate the password for the next use.
        Generate a new code in base-36 (lets + nums).
        We double up the Math.random()s for a bigger number,
        and add one to the result to prevent a password of 0.
         */
        var newcode;
        newcode = (Math.random() + Math.random() + 1).toString(36).substring(7);
        socket.session.password = newcode;
        return socket.emit('newpassword', newcode);
      });
      socket.on('getuniques', function() {
        return give_uniques();
      });
      return socket.on('isloggedin', function() {
        return socket.emit('isloggedin', socket.session.logged_in);
      });
    });
  };

}).call(this);

//# sourceMappingURL=../../maps/sio.js.map
