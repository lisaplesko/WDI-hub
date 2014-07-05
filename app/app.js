'use strict';

var gaApp = angular.module('gaApp', ['ngRoute', 'ngAnimate']);

// gaApp.factory('studentCache', ['$cacheFactory', function ($cacheFactory) {
//   return $cacheFactory('studentData');
// }]);



// CONTROLLERS

gaApp.controller('StudentsCtrl', ['$scope', 'studentsFactory', function ($scope, studentsFactory) {

  $scope.students = [];

  function init() {
    studentsFactory.getStudents()
      .success(function (students) {
        $scope.students = students;
      })
      .error(function(data) {
        console.log(data);
      });
  }

  init();

}]);


gaApp.controller('StudentShowCtrl', ['$scope', 'studentsFactory', '$routeParams', function ($scope, studentsFactory, $routeParams){
  var studentId = $routeParams.studentId;
  $scope.student = null;

  function init() {
    studentsFactory.getStudent(studentId)
      .success(function (student) {
        $scope.student = student;
      })
      .error(function(data) {
        console.log(data);
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


