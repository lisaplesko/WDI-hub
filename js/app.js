'use strict';

var gaApp = angular.module('gaApp', ['ngAnimate']);

gaApp.controller('StudentsCtrl', ['$scope', '$http', function ($scope, $http) {

  $scope.students = [];
  $http({
    url: 'http://localhost:3000/students',
    method: 'GET',
  }).success(function (students){
    $scope.students = students;
    $scope.studentsCount = $scope.students.length;
  }).error(function(){
    console.log('Failed to load posts');
  });

}]);



// }).success(function(data, status, headers, config) {
//   // data contains the response
//   // status is the HTTP status
//   // headers is the header getter function
//   // config is the object that was used to create the HTTP request
// }).error(function(data, status, headers, config) {
// });
