class ApplicationController < ActionController::Base
  
  include SessionsHelper

  protect_from_forgery with: :exception

  before_action :check_logged_in
  before_action :get_spotify_user

  layout :set_layout

  private

  def check_logged_in
    unless logged_in?
      redirect_to login_url
    end
  end

  def get_spotify_user
    @spotify_user = RSpotify::User.new(current_user.spotify_user)
  end

  def set_layout
    if logged_in?
      'application'
    else
      'landing'
    end
  end

end
