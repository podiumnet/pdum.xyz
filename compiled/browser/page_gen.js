
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
  Element.prototype.copyProperties = function(properties, root) {
    var prop, results;
    if (root == null) {
      root = this;
    }
    results = [];
    for (prop in properties) {
      if (typeof prop === 'Array') {
        results.push(this.copyProperties(properties[prop], root[prop]));
      } else {
        results.push(root[prop] = properties[prop]);
      }
    }
    return results;
  };

  Element.prototype.prependChild = function(child) {
    return this.insertBefore(child, this.firstChild);
  };

  Document.prototype.generateElement = function(data) {
    var child, elem, i;
    if (data.type === "textNode") {
      elem = this.createTextNode(data.text);
    } else {
      elem = this.createElement(data.type);
      elem.copyProperties(data.props);
      for (i in data.children) {
        child = this.generateElement(data.children[i]);
        elem.appendChild(child);
      }
    }
    return elem;
  };

}).call(this);

//# sourceMappingURL=../../maps/page_gen.js.map
