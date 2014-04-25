function BinaryTree(root) {
  this.root = root;
  this.left = undefined;
  this.right = undefined;
}

BinaryTree.prototype.addChild = function(childTree) {};
BinaryTree.prototype.addLeft = function(childTree) {};
BinaryTree.prototype.addRight = function(childTree) {};

BinaryTree.prototype.copy = function() {};

BinaryTree.prototype.equals = function(other) {};
