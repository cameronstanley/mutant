# mutant [![Build Status](https://travis-ci.org/cameronstanley/mutant.svg?branch=master)](https://travis-ci.org/cameronstanley/mutant)
Spotify Playlist Manager

## Features
* Preview a playlist
* Create a playlist
* Export a playlist to CSV
* Build playlists from RSS feeds

## Getting Started
Mutant utilizes the Spotify Web API. In order to run your own instance you will need to [register an app](https://developer.spotify.com/my-applications/#!/applications) and add the client ID and secret to your path:

```
export SPOTIFY_CLIENT_ID=<App Client ID>
export SPOTIFY_CLIENT_SECRET=<App Client Secret>
```

Once configured, run:
```
bundle install
rake db:migrate
rails s
```


## Testing
Mutant uses RSpec for testing. In order to run the test suite, you will need to have a Spotify account. Start the app, log in, and then navigate to /auth/spotify/token to find your token info. Add your user ID, token, and refresh token to your path:
```
export TEST_SPOTIFY_USER_ID=<User ID>
export TEST_SPOTIFY_TOKEN=<Token>
export TEST_SPOTIFY_REFRESH_TOKEN=<Refresh Token>
```
Use `rake` to run the test suite once configured.

VCR is utilized for capturing requests/responses, but the cassettes are not checked in because they contain confidential information. **Be advised that tests will execute against your own Spotify account.**
