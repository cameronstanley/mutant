module SessionsHelper

  def current_user
    @current_user = User.find(session[:user_id]) if session[:user_id]
  end

  def logged_in?
    current_user.present?
  end

  def log_in(spotify_user)
    user = User.find_by(spotify_id: spotify_user.id)

    if user.nil?
      user = User.create(spotify_id: spotify_user.id, spotify_user: spotify_user.to_hash) 
    else
      user.update(spotify_user: spotify_user.to_hash)
    end

    session[:user_id] = user.id
  end

  def log_out
    session[:user_id] = nil
  end

end
