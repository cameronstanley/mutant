angular.module('mutantApp').controller('newPlaylistCtrl', function($scope, $http, $location) {
  $scope.create = function(playlist) {
    $http.post('/api/playlists', playlist).success(function() {
      $location.path('/playlists');
    });
  };
});
