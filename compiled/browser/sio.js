
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
  var boundverifies, socket, verifiedlegit, verifyLegit;

  window.socket = socket = io();

  verifiedlegit = false;

  boundverifies = [];

  window.bindVerify = function(callback) {
    if (verifiedlegit) {
      callback();
    }
    return boundverifies.push(callback);
  };

  verifyLegit = function() {
    console.log("Requested legitimacy verification.");
    return socket.emit('verifylegit', {
      id: localStorage.unique_id,
      password: localStorage.id_password
    });
  };

  socket.on('seemslegit', function(data) {
    var func, results;
    if (data) {
      console.log("Recieved new local password.");
      localStorage.id_password = data;
    }
    console.log("Client verified legitimate.");
    verifiedlegit = true;
    results = [];
    for (func in boundverifies) {
      results.push(boundverifies[func]());
    }
    return results;
  });

  socket.on('assigned_uniques', function(data) {
    console.log("Recieved new local uniques.");
    localStorage.unique_id = data.id;
    localStorage.id_password = data.password;
    return verifyLegit();
  });

  if (!localStorage.unique_id || !localStorage.id_password) {
    console.log("Requesting new local uniques.");
    socket.emit('getuniques');
  } else {
    verifyLegit();
  }

}).call(this);

//# sourceMappingURL=../../maps/sio.js.map
