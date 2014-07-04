'use strict';

var gaApp = angular.module('gaApp', []);

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


