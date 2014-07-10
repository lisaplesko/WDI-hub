'use strict';

var gaApp = angular.module('gaApp', ['ngRoute', 'ngAnimate']);

// ROUTES

gaApp.config(['$routeProvider', function ($routeProvider){
// give path, view, controller
  $routeProvider
    .when('/students',
      {
        controller: 'StudentsCtrl',
        templateUrl: 'app/views/students.html'
      })
    .when('/students/:studentId',
      {
        controller: 'StudentCtrl',
        templateUrl: 'app/views/student.html'
      })
    .when('/home',
      {
        controller: 'HomeCtrl',
        templateUrl: 'app/views/home.html'
      })
    .otherwise({ redirectTo: '/home' });
}]);


