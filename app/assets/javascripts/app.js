angular.module('mutantApp', ['ngRoute']);

angular.module('mutantApp').config(['$routeProvider', '$locationProvider', function($routeProvider, $locationProvider) {
  $routeProvider
    .when('/playlists', {
      templateUrl: 'templates/playlists/index.html',
      controller: 'playlistsCtrl'
    })
    .when('/playlists/new', {
      templateUrl: 'templates/playlists/new.html',
      controller: 'newPlaylistCtrl'
    })
    .when('/', {
      templateUrl: 'templates/playlists/index.html',
      controller: 'playlistsCtrl'
    })
  ;

  $locationProvider.html5Mode(true);
}]);

angular.module('mutantApp').controller('playlistsCtrl', function($scope, $http) {
  $http.get('/api/playlists').success(function(data) {
    $scope.playlists = data;
  });
});

angular.module('mutantApp').controller('newPlaylistCtrl', function($scope, $http) {
  $scope.create = function(playlist) {
    $http.post('/api/playlists', playlist).success(function() {
      console.log("success"); 
    });
  };
});
