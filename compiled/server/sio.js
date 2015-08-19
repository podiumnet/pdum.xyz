
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
    var io;
    console.log("Initializing Socket.io");
    io = require('socket.io')(http);
    return io.on('connection', function(socket) {
      return socket.on('isloggedin', function() {
        return socket.emit('isloggedin', false);
      });
    });
  };

}).call(this);

//# sourceMappingURL=../../maps/sio.js.map
