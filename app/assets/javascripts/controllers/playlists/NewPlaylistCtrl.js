angular.module('mutantApp').controller('newPlaylistCtrl', function($scope, $http, $location, Playlist) {
  $scope.create = function(playlist) {
    Playlist.create.success(function() {
      $location.path('/playlists');
    });
  };
});
