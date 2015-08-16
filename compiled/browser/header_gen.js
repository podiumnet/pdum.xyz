
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
  var header;

  header = document.generateElement({
    type: "header",
    children: [
      {
        type: "div",
        props: {
          className: "logo"
        },
        children: []
      }, {
        type: "a",
        props: {
          innerHTML: "Log In",
          href: "/login"
        },
        children: []
      }, {
        type: "a",
        props: {
          innerHTML: "Sign Up",
          href: "/signup"
        },
        children: []
      }
    ]
  });

  document.body.prependChild(header);

}).call(this);

//# sourceMappingURL=../../maps/header_gen.js.map
