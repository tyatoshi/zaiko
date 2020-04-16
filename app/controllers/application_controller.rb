class ApplicationController < ActionController::Base
  include SessionsHelper
  
  private

  def require_user_unlogged_in
    unless logged_in?
      redirect_to login_url
    end
  end
  
  def require_user_logged_in
    if logged_in?
      redirect_to zaikos_path
    end
  end
  
  
  
  
end
