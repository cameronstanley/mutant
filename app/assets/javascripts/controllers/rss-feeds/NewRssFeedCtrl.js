angular.module('mutantApp')
.controller('newRssFeedCtrl', function($scope, $routeParams, $location, RssFeed) {
  $scope.userId = $routeParams['userId'];
  $scope.playlistId = $routeParams['playlistId'];
  $scope.rssFeed = {};

  $scope.save = function(rssFeed) {
    RssFeed.create($scope.userId, $scope.playlistId, rssFeed).success(function() {
      $location.path('/users/' + $scope.userId + '/playlists/' + $scope.playlistId + '/rss_feeds');
    });
  }
});
