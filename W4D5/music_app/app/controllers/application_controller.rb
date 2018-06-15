class ApplicationController < ActionController::Base

  protect_from_forgery with: :exception

  helper_method :current_user, :logged_in?, :auth_token


  def current_user
    return nil unless session[:session_token]
    @user ||= User.find_by(session_token: session[:session_token])
  end

  def ensure_logged_in
    redirect_to new_session_url unless logged_in?
  end

  def login!(user)
    session[:session_token] = user.session_token
  end

  def log_out!
    current_user.reset_session_token
    session[:session_token] = nil
  end

  def logged_in?
    !!current_user
  end

  def ensure_logged_out
    redirect_to user_url(current_user) if logged_in?
  end

  def auth_token
      output = "<input
      type=\"hidden\"
      name=\"authenticity_token\"
      value=\"#{form_authenticity_token}\">".html_safe

      output
  end
end
