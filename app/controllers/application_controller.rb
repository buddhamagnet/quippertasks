class ApplicationController < ActionController::Base
  protect_from_forgery
    
  def authenticate
    unless user_signed_in?
      flash[:notice] = "Please log in to perform this action"
      redirect_to root_path and return
    end
  end
end