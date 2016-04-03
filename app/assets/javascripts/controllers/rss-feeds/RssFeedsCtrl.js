angular.module('mutantApp')
.controller('rssFeedsCtrl', function($scope, $http, $routeParams, RssFeed) {
  $scope.userId = $routeParams['userId'];
  $scope.playlistId = $routeParams['playlistId'];
  $scope.playlist = {};
  $scope.rssFeeds = [];

  RssFeed.query($scope.userId, $scope.playlistId).success(function(data) {
    $scope.rssFeeds = data;
  });
});
