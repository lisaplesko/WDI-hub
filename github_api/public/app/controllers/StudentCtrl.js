gaApp.controller('StudentCtrl', ['$scope', 'studentsFactory', '$routeParams', function ($scope, studentsFactory, $routeParams){
  var studentId = $routeParams.studentId;
  $scope.student = null;
  $scope.languages = null;

  function init() {
    studentsFactory.getStudent(studentId)
      .success(function (student) {
        $scope.student = student;
      })
      .error(function(data) {
        console.log(data);
      });

    studentsFactory.getStudentLanguages(studentId)
      .success(function (language) {
        $scope.languages = language;
        $scope.max = 0;
        for(var i in $scope.languages) { if ($scope.languages[i] > $scope.max) {$scope.max = $scope.languages[i];} }
      });
  }

  init();

}]);


// {"JavaScript":217313,"Ruby":222897,"CSS":84974}
