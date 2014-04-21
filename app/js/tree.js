function Tree(root) {
  this.root = root;
  this.children = [];
}

Tree.prototype.addChild = function(childTree) {
  this.children.push(childTree);
};

Tree.prototype.copy = function() {
  var copiedTree = new Tree(this.root);
  this.children.forEach(function(child, childIndex, children) {
    copiedTree.children.push(child.copy());
  });
  return copiedTree;
};

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
