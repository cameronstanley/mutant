angular.module('mutantApp')
.controller('playlistCtrl', function($scope, $http, $routeParams, $location, $sce, Playlist) {
  $scope.userId = $routeParams['userId'];
  $scope.playlistId = $routeParams['playlistId'];
  $scope.playlist = {};
  $scope.tracks = [];
  
  Playlist.get($scope.userId, $scope.playlistId).success(function(data) {
    $scope.playlist = data.playlists;
    $scope.tracks = data.tracks;
  });

  $scope.unfollow = function() {
    return Playlist.delete($scope.userId, $scope.playlistId).success(function() {
      $location.path('/playlists');      
    });
  }

  $scope.spotify_embed_url = $sce.trustAsResourceUrl('https://embed.spotify.com/?uri=spotify:user:' + $scope.userId + ':playlist:' + $scope.playlistId + '&theme=white" width="300" height="380" frameborder="0" allowtransparency="true"');
});
