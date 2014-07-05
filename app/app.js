'use strict';

var gaApp = angular.module('gaApp', ['ngRoute']);

// gaApp.factory('studentCache', ['$cacheFactory', function ($cacheFactory) {
//   return $cacheFactory('studentData');
// }]);



// CONTROLLERS

gaApp.controller('StudentsCtrl', ['$scope', 'studentsFactory', '$http', '$cacheFactory', function ($scope, studentsFactory, $http, $cacheFactory) {

  $scope.students = [];

  function init() {
    studentsFactory.getStudents()
      .success(function (students) {
        $scope.students = students;
      })
      .error(function() {
        console.log('Failed to load');
      });
  }

  init();

}]);


gaApp.controller('StudentShowCtrl', ['$scope', 'studentsFactory', '$http', '$routeParams', function ($scope, studentsFactory, $http, $routeParams){
  var studentId = $routeParams.studentId;
  $scope.student = null;

  function init() {
    studentsFactory.getStudent(studentId)
      .success(function (student) {
        $scope.student = student;
      })
      .error(function() {
        console.log('Failed to load');
      });
  }

  init();

}]);



// ROUTES


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


