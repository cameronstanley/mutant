angular.module('mutantApp', ['ngRoute']);

angular.module('mutantApp').config(['$routeProvider', '$locationProvider', function($routeProvider, $locationProvider) {
  $routeProvider
    .when('/playlists', {
      templateUrl: 'templates/playlists/index.html',
      controller: 'playlistsCtrl'
    })
    .when('/users/:user_id/playlists/:playlist_id', {
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
