angular.module('mutantApp')
.service('Playlist', function($http) {
  this.query = function() { 
    return $http.get('/api/playlists');
  };

  this.get = function(userId, playlistId) {
    return $http.get('/api/users/' + userId + '/playlists/' + playlistId);
  }

  this.create = function(playlist) {
    return $http.post('/api/playlists', playlist);
  };

  this.delete = function(userId, playlistId) {
    return $http.delete('/api/users/' + userId + '/playlists/' + playlistId);
  }
});
