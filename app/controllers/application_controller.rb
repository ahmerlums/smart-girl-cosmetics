class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :null_session     
  helper_method :current_user
  helper_method :current_admin

private

def current_user
  @current_user ||= User.find(session[:user_id]) if session[:user_id]
end

def current_admin
  @current_admin ||= User.find(session[:user_id]) if session[:user_id] == 3
end

def require_admin 
  redirect_to '/log_in' unless current_admin
  end
  
  

  def require_user 
  redirect_to '/log_in' unless current_user 
  end
  
end