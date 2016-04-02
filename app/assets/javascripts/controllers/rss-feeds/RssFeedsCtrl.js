angular.module('mutantApp').controller('rssFeedsCtrl', function($scope, $http, $routeParams) {
  $scope.userId = $routeParams['userId'];
  $scope.playlistId = $routeParams['playlistId'];
  $scope.playlist = {};
  $scope.rssFeeds = [];

  $http.get('/api/users/{{userId}}}/playlists/{{playlistId}}/rss_feeds').success(function(data) {
    $scope.rssFeeds = data;
  });
});
