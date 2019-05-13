class ApplicationController < ActionController::Base
  helper_method :current_user

  def current_user
    session[:user_id].nil? ? nil : User.find(session[:user_id])
  end
  
  def welcome
  end
end
