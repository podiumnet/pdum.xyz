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
window.socket = socket = io()

verifiedlegit = false

boundverifies = []
window.bindVerify = (callback) ->
  callback() if verifiedlegit
  boundverifies.push callback

# Here we ask the server to verify if our session is legitimate.
verifyLegit = ->
  console.log "Requested legitimacy verification."
  socket.emit 'verifylegit',
    id: localStorage.unique_id
    password: localStorage.id_password

socket.on 'seemslegit', (data) ->
  if data
    console.log "Recieved new local password."
    localStorage.id_password = data
  console.log "Client verified legitimate."
  verifiedlegit = true
  for func of boundverifies
    boundverifies[func]()

# Get uniques when assigned
socket.on 'assigned_uniques', (data) ->
  console.log "Recieved new local uniques."
  localStorage.unique_id = data.id
  localStorage.id_password = data.password
  verifyLegit()

# Get uniques if not assigned.
if !localStorage.unique_id or !localStorage.id_password
  console.log "Requesting new local uniques."
  socket.emit 'getuniques'
else
  verifyLegit()
