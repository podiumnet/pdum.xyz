
/*
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
 */

(function() {
  module.exports = {
    sessions: {},
    get: function(uniqueid, password) {
      if (this.sessions[uniqueid] && this.sessions[uniqueid].password === password) {
        return this.sessions[uniqueid];
      }
    },
    "new": function() {
      var newcode;
      while (true) {
        newcode = (Math.random() + Math.random() + 1).toString(36).substring(7);
        if (!this.sessions[newcode]) {
          this.sessions[newcode] = {
            meetups: 0,
            logged_in: false
          };
          return newcode;
        }
      }
    }
  };

}).call(this);

//# sourceMappingURL=../../maps/session_manager.js.map
