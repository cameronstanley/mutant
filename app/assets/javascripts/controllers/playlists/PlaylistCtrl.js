angular.module('mutantApp').controller('playlistCtrl', function($scope, $http, $routeParams, $location, $sce) {
  $scope.user_id = $routeParams['user_id'];
  $scope.playlist_id = $routeParams['playlist_id'];
  $scope.playlist = {};
  $scope.tracks = [];
  
  $http.get('/api/users/' + $scope.user_id + '/playlists/' + $scope.playlist_id).success(function(data) {
    $scope.playlist = data.playlists;
    $scope.tracks = data.tracks;
  });

  $scope.unfollow = function() {
    return $http.delete('/api/users/' + $scope.user_id + '/playlists/' + $scope.playlist_id).success(function() {
      $location.path('/playlists');      
    });
  }

  $scope.spotify_embed_url = $sce.trustAsResourceUrl('https://embed.spotify.com/?uri=spotify:user:' + $scope.user_id + ':playlist:' + $scope.playlist_id + '&theme=white" width="300" height="380" frameborder="0" allowtransparency="true"');
});
