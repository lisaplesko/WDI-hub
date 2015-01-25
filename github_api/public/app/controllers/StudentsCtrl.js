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

  $scope.$watch('search.cohort', function(){
    if($scope.search) {
      $scope.attend_dates = getSessionDates($scope.search.cohort);
    }
  });

  getSessionDates = function(cohort) {
    switch(cohort) {
      case 1:
        return "September - December, 2013";
      case 2:
        return "January - April, 2014";
      case 3:
        return "April - July, 2014";
      case 4:
        return "July - September, 2014";
      case 5:
        return "September - December, 2014";
      case 6:
        return "January - April, 2015";
      default:
        return "";
    };
  };

}]);
