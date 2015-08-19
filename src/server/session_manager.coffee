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
module.exports =
  sessions: {}
  get: (uniqueid, password) ->
    if @sessions[uniqueid] and @sessions[uniqueid].password is password
      @sessions[uniqueid]

  new: ->
    while true
      newcode =
        (Math.random()+Math.random()+1).toString(36).substring 7
      if !@sessions[newcode]
        @sessions[newcode] =
          meetups: 0
          logged_in: false
        return newcode
