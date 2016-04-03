angular.module('mutantApp')
.service('RssFeed', function($http) {
  this.query = function(userId, playlistId) {
    return $http.get('/api/users/' + userId + '/playlists/' + playlistId + '/rss_feeds');
  };

  this.create = function(userId, playlistId, rssFeed) {
    return $http.post('/api/users/' + userId + '/playlists/' + playlistId + '/rss_feeds');
  }

  this.update = function(userId, playlistId, rssFeedId, rssFeed) {
    return $http.put('/api/users/' + userId + '/playlists/' + playlistId + '/rss_feeds/' + rssFeedId); 
  }

  this.delete = function(userId, playlistId, rssFeedId) {
    return $http.delete('/api/users/' + userId + '/playlists/' + playlistId + '/rss_feeds/' + rssFeedId);
  }
});
