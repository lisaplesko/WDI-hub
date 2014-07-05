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
