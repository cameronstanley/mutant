angular.module('mutantApp', ['ngRoute']);

angular.module('mutantApp').config(['$routeProvider', '$locationProvider', function($routeProvider, $locationProvider) {
  $routeProvider
    .when('/playlists', {
      templateUrl: 'templates/playlists/index.html',
      controller: 'playlistsCtrl'
    })
    .when('/users/:user_id/playlists/:id', {
      templateUrl: 'templates/playlists/show.html',
      controller: 'playlistCtrl'
    })
    .when('/playlists/new', {
      templateUrl: 'templates/playlists/new.html',
      controller: 'newPlaylistCtrl'
    })
    .otherwise({
      redirectTo: function(routeParams, path, search) {
        if (search.goto) {
          return '/' + search.goto;
        } else {
          return '/playlists';
        }
      }
    });
  ;

  $locationProvider.html5Mode(true);
}]);

angular.module('mutantApp').controller('playlistsCtrl', function($scope, $http) {
  $scope.playlists = [];

  $http.get('/api/playlists').success(function(data) {
    $scope.playlists = data;
  });
});

angular.module('mutantApp').controller('playlistCtrl', function($scope, $http, $routeParams) {
  $scope.user_id = $routeParams['user_id'];
  $scope.id = $routeParams['id'];
  
  $http.get('/api/users/' + $scope.user_id + '/playlists/' + $scope.playlist_id).success(function(data) {
    $scope.playlist = data;
  });
});

angular.module('mutantApp').controller('newPlaylistCtrl', function($scope, $http, $location) {
  $scope.create = function(playlist) {
    $http.post('/api/playlists', playlist).success(function() {
      $location.path('/playlists');
    });
  };
});
