'use strict';

var gaApp = angular.module('gaApp', ['ngRoute']);

// gaApp.factory('studentCache', ['$cacheFactory', function ($cacheFactory) {
//   return $cacheFactory('studentData');
// }]);

gaApp.controller('StudentsCtrl', ['$scope', '$http', '$cacheFactory', function ($scope, $http, $cacheFactory) {

  $scope.students = [];
  $http({
    url: 'http://localhost:3000/students',
    method: 'GET',
    cache: true
  }).success(function (students){
    $scope.students = students;
    $scope.studentsCount = $scope.students.length;
  }).error(function(){
    console.log('Failed to load posts');
  });

}]);


gaApp.controller('StudentShowCtrl', ['$scope', '$routeParams', function ($scope, $routeParams){
  $scope.studentId = $routeParams.studentId;
}]);


gaApp.config(function ($routeProvider){
// give path, view, controller
  $routeProvider
    .when('/',
      {
        controller: 'StudentsCtrl',
        templateUrl: 'app/views/students.html'
      })
    .when('/students',
      {
        controller: '',
        templateUrl: ''
      })
    .when('/students/:studentId',
      {
        controller: '',
        templateUrl: ''
      })
    .otherwise({ redirectTo: '/' });

});


