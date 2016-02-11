module SessionsHelper

  def logged_in?
    session[:spotify_user].present?
  end

  def log_in(spotify_user)
    session[:spotify_user] = spotify_user
  end

  def log_out
    session[:spotify_user] = nil
  end

end
