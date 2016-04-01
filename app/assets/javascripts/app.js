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
    .when('/users/:user_id/playlists/:playlist_id/rss_feeds', {
      templateUrl: 'templates/rss_feeds/index',
      controller: 'rssFeedsCtrl'
    })
    .when('/users/:user_id/playlists/:playlist_id/rss_feeds/new', {
      templateUrl: 'templates/rss_feeds/new',
      controller: 'newRssFeedCtrl'
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

angular.module('mutantApp').controller('playlistCtrl', function($scope, $http, $routeParams, $location, $sce) {
  $scope.user_id = $routeParams['user_id'];
  $scope.playlist_id = $routeParams['playlist_id'];
  $scope.playlist = {};
  $scope.tracks = [];
  
  $http.get('/api/users/' + $scope.user_id + '/playlists/' + $scope.playlist_id).success(function(data) {
    $scope.playlist = data.playlists;
    console.log(data.tracks);
    $scope.tracks = data.tracks;
  });

  $scope.unfollow = function() {
    return $http.delete('/api/users/' + $scope.user_id + '/playlists/' + $scope.playlist_id).success(function() {
      $location.path('/playlists');      
    });
  }

  $scope.spotify_embed_url = $sce.trustAsResourceUrl('https://embed.spotify.com/?uri=spotify:user:' + $scope.user_id + ':playlist:' + $scope.playlist_id + '&theme=white" width="300" height="380" frameborder="0" allowtransparency="true"');
});

angular.module('mutantApp').controller('newPlaylistCtrl', function($scope, $http, $location) {
  $scope.create = function(playlist) {
    $http.post('/api/playlists', playlist).success(function() {
      $location.path('/playlists');
    });
  };
});
