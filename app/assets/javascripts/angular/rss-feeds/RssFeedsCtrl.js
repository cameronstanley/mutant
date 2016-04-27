angular.module('mutantApp')
.controller('rssFeedsCtrl', function($scope, $http, $routeParams, Playlist, RssFeed) {
  $scope.userId = $routeParams['userId'];
  $scope.playlistId = $routeParams['playlistId'];
  $scope.playlist = {};
  $scope.rssFeeds = [];

  Playlist.get($scope.userId, $scope.playlistId).success(function(data) {
    $scope.playlist = data;
  });

  RssFeed.query($scope.userId, $scope.playlistId).success(function(data) {
    $scope.rssFeeds = data;
  });
});
