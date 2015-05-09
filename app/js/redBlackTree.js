function RedBlackNode(value, color) {
  this.value = value;
  this.color = color;
}

function RedNode(value) {
  new RedBlackNode(value, "red");
}
function BlackNode(value) {
  new RedBlackNode(value, "black");
}

function RedBlackTree(root) {
  this.root = new BlackNode(root);
}

RedBlackTree.prototype.insert = function(child) {};
RedBlackTree.prototype.delete = function(child) {};
RedBlackTree.prototype.isValid = function() {};
