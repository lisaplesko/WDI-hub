'use strict';

var gaApp = angular.module('gaApp', ['ngRoute', 'ngAnimate']);

// ROUTES

gaApp.config(function ($routeProvider){

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


