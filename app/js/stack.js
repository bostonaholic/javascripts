function Stack() {
  this.length = 0;
}

Stack.prototype.push = function(data) {
  this.length += 1;
};

Stack.prototype.pop = function() {
  return 'foo';
};
