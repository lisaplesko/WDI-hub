gaApp.filter('orderEventBy', function() {
  return function(items, field, reverse) {
    var filtered = [];
    angular.forEach(items, function(item, key) {
      item["key"] = key;
      filtered.push(item);
    });
    filtered.sort(function (a, b) {
      return (a[field] > b[field]) ? 1 : ((a[field] < b[field]) ? -1 : 0);
    });
    if(reverse) filtered.reverse();
    return filtered;
  };
});
