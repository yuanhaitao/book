class ApplicationController < ActionController::Base
  before_filter :authorize

  protect_from_forgery
  

  protected
  def authorize
  	unless User.find_by_id(session[:user_id]) and session[:user_auth]
  		redirect_to login_url, :alert =>"您试图进入管理员的页面所以请以管理员身份登录"
  	end
  end

end
