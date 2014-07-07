'use strict';

var gaApp = angular.module('gaApp', ['ngRoute', 'ngAnimate']);

// gaApp.factory('studentCache', ['$cacheFactory', function ($cacheFactory) {
//   return $cacheFactory('studentData');
// }]);




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
        controller: 'StudentCtrl',
        templateUrl: 'app/views/student.html'
      })
    .otherwise({ redirectTo: '/' });

});


