
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
  module.exports = function(maindir) {
    var app, environment, express, forrx, http, sio;
    express = require('express');
    app = express();
    http = require('http').Server(app);
    forrx = require("forrx");
    sio = require("./sio");
    sio(http);
    environment = require('./environment');
    app.use(function(req, res, next) {
      res.header("Access-Control-Allow-Origin", "*");
      res.header('Access-Control-Allow-Credentials', true);
      res.header('Access-Control-Allow-Methods', 'POST, GET, PUT, DELETE, OPTIONS');
      res.header('Access-Control-Allow-Headers', 'Content-Type');
      return next();
    });
    app.use(express["static"](maindir + "/compiled/browser"));
    app.use(express["static"](maindir + "/css"));
    app.use(forrx("compiled/pub"));
    return http.listen(environment.port, environment.ip, function() {
      return console.log('PODIUM SERVER Listening @ %s:%s', environment.ip, environment.port);
    });
  };

}).call(this);

//# sourceMappingURL=../../maps/server.js.map
