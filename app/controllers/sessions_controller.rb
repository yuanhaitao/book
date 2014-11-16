class SessionsController < ApplicationController
 skip_before_filter :authorize
  def new

  end

  def create
    if params[:name] && params[:password]
    if user=User.authenticate(params[:name],params[:password]) and (params[:name]=="yhaitao")
       session[:user_id]=user.id
       session[:user_auth]=true
       redirect_to store_url

  	elsif user=User.authenticate(params[:name],params[:password])
         
  	  	session[:user_id]=user.id
        session[:user_auth]=false
  	  	redirect_to store_url
  	 else  
  	  	redirect_to login_url, :alert => "用户名或者密码错误"
  	  end
    else
      redirect_to login_url 
    end
  end

  def destroy
    session[:user_id]=nil
    session[:user_auth]=false
    redirect_to store_url, :notice=>"注销成功"
  end
end
