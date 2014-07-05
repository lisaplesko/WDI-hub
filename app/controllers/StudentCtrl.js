gaApp.controller('StudentCtrl', ['$scope', 'studentsFactory', '$routeParams', function ($scope, studentsFactory, $routeParams){
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
