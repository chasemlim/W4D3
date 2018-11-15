class ApplicationController < ActionController::Base
  helper_method :current_user
  
  def current_user
    @current_user ||= User.find_by(session_token: session[:session_token])
  end
  
  def login!(user)
    user.session_token = user.reset_session_token!
    session[:session_token] = user.session_token
    redirect_to cats_url
  end
  
  def logout!
    if current_user 
      current_user.reset_session_token!
      session[:session_token] = nil 
      flash[:logout] = "Successful logout!"
      redirect_to new_session_url
    end
  end
  
end
