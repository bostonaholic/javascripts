function DoubleLinkNode(data) {
  this.data = data;
  this.previous = undefined;
  this.next = undefined;
}

DoubleLinkNode.prototype.appendToTail = function(data) {
  var end = new DoubleLinkNode(data);
  var penultimate = this;
  while(penultimate.next !== undefined) {
    penultimate = penultimate.next;
  }
  penultimate.next = end;
  end.previous = penultimate;
};
