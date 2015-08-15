(function() {
  module.exports = function(maindir) {
    var app, environment, express, server;
    express = require('express');
    app = express();
    environment = require('./environment');
    app.use(express["static"](maindir + "/web"));
    app.use(express["static"](maindir + "/compiled/browser"));
    return server = app.listen(environment.port, environment.ip, function() {
      return console.log('PODIUM SERVER Listening @ %s:%s', environment.ip, environment.port);
    });
  };

}).call(this);

//# sourceMappingURL=../../maps/server.js.map
