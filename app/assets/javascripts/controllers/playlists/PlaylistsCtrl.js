angular.module('mutantApp')
.controller('playlistsCtrl', function($scope, $http, Playlist) {
  $scope.playlists = [];

  Playlist.query().success(function(data) {
    $scope.playlists = data;
  });
});
