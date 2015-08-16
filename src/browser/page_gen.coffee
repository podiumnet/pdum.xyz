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
Element::copyProperties = (properties, root = @) ->
  for prop of properties
    if typeof prop is 'Array'
      @copyProperties properties[prop], root[prop]
    else
      root[prop] = properties[prop]

Element::prependChild = (child) ->
  @insertBefore child, @firstChild

Document::generateElement = (data) ->
  if data.type is "textNode"
    elem = @createTextNode data.text
  else
    elem = @createElement data.type
    elem.copyProperties data.props
    for i of data.children
      child = @generateElement data.children[i]
      elem.appendChild child

  elem
