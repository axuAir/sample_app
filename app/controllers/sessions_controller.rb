class SessionsController < ApplicationController

#登录页面
  def new
  end
#完成登录操作
  def create
    user = User.find_by(email: params[:session][:email].downcase)
    if user && user.authenticate(params[:session][:password])
      log_in user
      params[:session][:remember_me] == '1' ? remember(user) : forget(user)
      redirect_back_or user

    else
      flash.now[:danger] = 'Invalid email/password combination'
      render 'new'
    end
  end
# 删除会话，退出用户
  def destroy
    log_out if logged_in?
    redirect_to root_url
  end
  
end
