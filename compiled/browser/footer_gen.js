
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
  var footer;

  footer = document.generateElement({
    type: "footer",
    children: [
      {
        type: "textNode",
        text: "Copyright \u00A9 2015 Podium Contributors"
      }, {
        type: "br"
      }, {
        type: "a",
        props: {
          href: "/about",
          innerHTML: "About"
        }
      }, {
        type: "textNode",
        text: " | "
      }, {
        type: "a",
        props: {
          href: "/login",
          innerHTML: "Log In"
        }
      }, {
        type: "textNode",
        text: " | "
      }, {
        type: "a",
        props: {
          href: "/signup",
          innerHTML: "Sign Up"
        }
      }
    ]
  });

  document.body.appendChild(footer);

}).call(this);

//# sourceMappingURL=../../maps/footer_gen.js.map
