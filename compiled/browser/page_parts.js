(function() {
  var header;

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
    elem = this.createElement(data.type);
    elem.copyProperties(data.props);
    for (i in data.children) {
      child = this.generateElement(data.children[i]);
      elem.appendChild(child);
    }
    return elem;
  };

  header = document.generateElement({
    type: "header",
    props: {},
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
      }
    ]
  });

  document.body.prependChild(header);

}).call(this);

//# sourceMappingURL=../../maps/page_parts.js.map
