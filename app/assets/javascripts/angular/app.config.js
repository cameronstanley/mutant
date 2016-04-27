angular.module('mutantApp')
  .config(['$routeProvider', '$locationProvider', function($routeProvider, $locationProvider) {
    $routeProvider
      .when('/playlists', { 
        templateUrl: 'templates/playlists/index.html', 
        controller: 'playlistsCtrl' 
      })
      .when('/users/:userId/playlists/:playlistId', { 
        templateUrl: 'templates/playlists/show.html', 
        controller: 'playlistCtrl' 
      })
      .when('/playlists/new', { 
        templateUrl: 'templates/playlists/new.html', 
        controller: 'newPlaylistCtrl' 
      })
      .when('/users/:userId/playlists/:playlistId/rss_feeds', { 
        templateUrl: 'templates/rss-feeds/index.html', 
        controller: 'rssFeedsCtrl' 
      })
      .when('/users/:userId/playlists/:playlistId/rss_feeds/new', {
        templateUrl: 'templates/rss-feeds/new.html',
        controller: 'newRssFeedCtrl'
      })
      .when('/users/:userId/playlists/:playlidID/rss_feeds/:rssFeedId/edit', {
        templateUrl: 'templates/rss-feeds/edit.html',
        controller: 'editRssFeedCtrl'
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
