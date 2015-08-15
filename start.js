/*
  This file is the starting point for the podium server.
  The only reason it doesn't start in compiled/server/server.js is because then
  we can't get the root directory.
  As a solution, we start at this file and pass __dirname to
  compiled/server/server.js.
 */
require("./compiled/server/server")(__dirname);
