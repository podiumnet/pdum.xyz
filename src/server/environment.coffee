###
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
###
module.exports =
  port: process.env.OPENSHIFT_NODEJS_PORT || 8080
  ip: process.env.OPENSHIFT_NODEJS_IP || '127.0.0.1'
  dbhost: process.env.OPENSHIFT_MYSQL_DB_HOST || 'localhost'
  dbport: process.env.OPENSHIFT_MYSQL_DB_PORT || 3306
  dbusername: process.env.OPENSHIFT_MYSQL_DB_USERNAME || process.argv[2]
  dbpassword: process.env.OPENSHIFT_MYSQL_DB_PASSWORD || process.argv[3]
  dbname: "podium"
