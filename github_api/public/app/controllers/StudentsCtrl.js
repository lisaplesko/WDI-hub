gaApp.controller('StudentsCtrl', ['$scope', 'studentsFactory', function ($scope, studentsFactory) {

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
