(function() {
  var boundlogins, loggedin_gotten;

  boundlogins = [];

  loggedin_gotten = false;

  window.bindLoginStatus = function(callback) {
    if (loggedin_gotten) {
      callback();
    }
    return boundlogins.push(callback);
  };

  socket.on('isloggedin', function(loggedin) {
    var func, results;
    console.log("Recieved logged-in status: " + loggedin + ".");
    window.logged_in = loggedin;
    loggedin_gotten = true;
    results = [];
    for (func in boundlogins) {
      results.push(boundlogins[func]());
    }
    return results;
  });

  bindVerify(function() {
    return socket.emit('isloggedin');
  });

}).call(this);

//# sourceMappingURL=../../maps/loginstatus.js.map
