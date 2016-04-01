angular.module('mutantApp').controller('playlistsCtrl', function($scope, $http) {
  $scope.playlists = [];

  $http.get('/api/playlists').success(function(data) {
    $scope.playlists = data;
  });
});
