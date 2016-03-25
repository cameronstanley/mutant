angular.module('mutantApp', ['ngRoute']);

angular.module('mutantApp').config(['$routeProvider', '$locationProvider', function($routeProvider, $locationProvider) {
  $routeProvider
    .when('/playlists', {
      templateUrl: 'templates/playlists.html',
      controller: 'playlistsCtrl'
    });

  $locationProvider.html5Mode(true);
}]);

angular.module('mutantApp').controller('playlistsCtrl', function($scope) {
  $scope.playlists = [{
    name: "Derp"
  }];
});
