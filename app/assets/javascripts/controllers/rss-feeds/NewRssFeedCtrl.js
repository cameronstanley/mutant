angular.module('mutantApp')
.controller('NewRssFeedCtrl', function($scope, $routeParams) {
  $scope.userId = $routeParams['userId'];
  $scope.playlistId = $routeParams['playlistId'];
});
