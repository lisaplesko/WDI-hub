gaApp.filter('orderEventBy', function() {
  return function(items, field, reverse) {
    var filtered = [];
    angular.forEach(items, function(item , key) {
      item["key"] = key;
      filtered.push(item);
    });
    filtered.sort(function (a, b) {
      if(a[field] > b[field]) return 1;
      if(a[field] < b[field]) return -1;
      return 0;
    });
    if(reverse) filtered.reverse();
    return filtered;
  };
});
