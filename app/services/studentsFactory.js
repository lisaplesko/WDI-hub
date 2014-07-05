gaApp.factory('studentsFactory', ['$http', '$cacheFactory', function ($http, $cacheFactory) {

  var factory = {};

  factory.getStudents = function() {
    // Return the promise, hand off to controller
    return $http.get('http://localhost:3000/students', { cache: true });
  };

  factory.getStudent = function(studentId) {
    return $http.get('http://localhost:3000/students/' + studentId, { cache: true });
  };

  return factory;

}]);


