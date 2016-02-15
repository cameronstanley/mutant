OmniAuth.config.test_mode = true

spotify_mock = {
  info: {
    id: ENV["TEST_SPOTIFY_USER_ID"],
    type: "user",
  },
  credentials: {
    token: ENV["TEST_SPOTIFY_TOKEN"],
    refresh_token: ENV["TEST_SPOTIFY_REFRESH_TOKEN"]
  }
}

OmniAuth.config.add_mock(:spotify, spotify_mock)
