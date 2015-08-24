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
module.exports = (ops) ->
  # Set Properties.
  ops.title "Podium"
  ops.style "/main.css"
  ops.style "/home.css"

  # Insert Body Content.
  topbox = ops.body.element "div"
  topbox.attr "class", "top box"

  # Insert Logo Box
  logocent = topbox.element "div"
  logocent.attr "class", "centered"

  # Insert Logo
  logo = logocent.element "img"
  logo.attr "class", "logo"
  logo.attr "src", "/images/logo-white.png"

  # Insert Search Box
  srccent = topbox.element "div"
  srccent.attr "class", "centered"

  # Insert Search Form
  srcfrm = srccent.element "form"
  srcfrm.attr "action", "/search"
  srcfrm.attr "method", "get"

  # Insert Search Textbox
  srctxt = srcfrm.element "input"
  srctxt.attr "type", "text"
  srctxt.attr "class", "search"

  # Insert Search Button
  srctxt = srcfrm.element "input"
  srctxt.attr "type", "submit"
  srctxt.attr "class", "search-go"
  srctxt.attr "value", "Search"

  ops.generate()
