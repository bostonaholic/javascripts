function HashTable() {
  this._keys = [];
  this._values = [];
}

HashTable.prototype.set = function(key, value) {
  var isSet = false;
  for(var index = 0; index < this.size(); index++) {
    if(this._keys[index] === key) {
      this._values[index] = value;
      isSet = true;
    }
  }
  if(!isSet) {
    this._keys.push(key);
    this._values.push(value);
  }
};

HashTable.prototype.get = function(key) {
  for(var index = 0; index < this.size(); index++) {
    if(this._keys[index] === key) {
      return this._values[index];
    }
  }
};

HashTable.prototype.size = function() {
  return this._keys.length;
};
