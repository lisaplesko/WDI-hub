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


gaApp.controller('StudentShowCtrl', ['$scope', '$http', '$routeParams', function ($scope, $http, $routeParams){
  $scope.studentId = $routeParams.studentId;
  $scope.student = null;

  $http({
    url: 'http://localhost:3000/students/' + $scope.studentId,
    method: 'GET',
    cache: true
  }).success(function (student){
    $scope.student = student;
    // $scope.studentsCount = $scope.students.length;
  }).error(function(){
    console.log('Failed to load posts');
  });

}]);


gaApp.config(function ($routeProvider){
// give path, view, controller
  $routeProvider
    .when('/',
      {
        controller: 'StudentsCtrl',
        templateUrl: 'app/views/students.html'
      })
    .when('/students/:studentId',
      {
        controller: 'StudentShowCtrl',
        templateUrl: 'app/views/student.html'
      })
    .otherwise({ redirectTo: '/' });

});


