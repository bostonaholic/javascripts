function SingleLinkNode(data) {
  this.data = data;
  this.next = undefined;
}

SingleLinkNode.prototype.appendToTail = function(data) {
  var end = new SingleLinkNode(data);
  var penultimate = this;
  while(penultimate.next !== undefined) {
    penultimate = penultimate.next;
  }
  penultimate.next = end;
};

SingleLinkNode.prototype.deleteNode = function(data) {
  var head = this;
  if(head.data === data) {
    // TODO: how to delete root node?
    return;
  }

  while(head.next !== undefined) {
    if(head.next.data === data) {
      head.next = head.next.next;
      return;
    }
    head = head.next;
  }
};
