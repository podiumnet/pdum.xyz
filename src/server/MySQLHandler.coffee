###
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
###
environment = require './environment'
mysql = require 'mysql'
class MySQLHandler
  constructor: ->
    @conn = mysql.createConnection
      host: environment.dbhost
      port: environment.dbport
      user: environment.dbusername
      password: environment.dbpassword
      database: environment.dbname

    @conn.connect()

  query: (query, callback) ->
    @conn.query query, (err, rows, fields) ->
      throw err if err
      callback fields




module.exports = MySQLHandler
