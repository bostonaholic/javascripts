/* A HashTable is a data structure that maps
 * keys to values for highly efficient lookup.
 */
function HashTable(bucketSize) {
  this.bucketSize = bucketSize || 32;
  this.size = 0;
  this._contents = [];
}

HashTable.prototype.set = function(key, value) {
  var bucket = this._getBucketFor(key);
  var position = this._getPositionFor(key, bucket);
  if(this._contents[bucket] === undefined) {
    this._contents[bucket] = [];
  }
  if(!this._contents[bucket][position]) {
    this.size += 1;
  }
  this._contents[bucket][position] = value;
};

HashTable.prototype.get = function(key) {
  var bucket = this._getBucketFor(key);
  var position = this._getPositionFor(key, bucket);
  return this._contents[bucket][position];
};

HashTable.prototype._getBucketFor = function(key) {
  return Math.floor(key / this.bucketSize);
};

HashTable.prototype._getPositionFor = function(key, bucket) {
  return bucket * this.bucketSize + key;
};
