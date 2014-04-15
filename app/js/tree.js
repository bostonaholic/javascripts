function Tree(root) {
  this.root = root;
  this.children = [];
}

var t = new Tree(0);

Tree.prototype.addChild = function(childTree) {
  this.children.push(childTree);
};

t.addChild(new Tree(1));
t.addChild(new Tree(2));

Tree.prototype.copy = function() {
  var copiedTree = new Tree(this.root);
  this.children.forEach(function(child, childIndex, children) {
    copiedTree.children.push(child.copy());
  });
  return copiedTree;
};

var tCopy = t.copy();

Tree.prototype.equals = function(other) {
  if (this.root !== other.root) { return false; }
  if (this.children.length !== other.children.length) { return false; }

  this.children.forEach(function(child, childIndex, children) {
    if (!child.equals(other.children[childIndex])) {
      return false;
    }
  });
  return true;
};

if (tCopy.equals(t)) {
  console.log('hooray!');
} else {
  console.log('booooo!');
}

t.addChild(new Tree(3));
if (!tCopy.equals(t)) {
  console.log('hooray!');
} else {
  console.log('booooo!');
}
