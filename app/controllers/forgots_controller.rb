class ForgotsController < ApplicationController
  
  require 'pry'
  
  def new
  end
  
  def create
    @user = User.find_by_email(params[:email])
    
    flash[:notice] = "Your password reset instruction has been sent to your email #{@user.email}"
    
    send_password_token
    redirect_to  root_path
  end
  
  def edit
    @user = User.find_by_password_reset_token(params[:password_reset_token])
  end
  
  def update
    @user = User.find_by_password_reset_token(params[:password_reset_token])
    
    # binding.pry
    
    if @user.password_reset_sent_at  > 30.minutes.ago
      @user.update(password: params[:password], password_reset_token: nil, password_reset_sent_at: nil)
      flash[:notice] = "Password has been reset"
      redirect_to root_path
    else
      flash[:alert] = "Password reset has expired, please redo forgot password"
      redirect_to reset_password_path(@user.password_reset_token)
    end
  end
  
  
  private
  
  def send_password_token
    # @user.password_reset_sent_at = Time.now
    # @user.password_reset_token = @user.regenerate_password_reset_token
    
    @user.update(password_reset_token: @user.regenerate_password_reset_token, password_reset_sent_at: Time.now)
    # binding.pry
    
    UsersMailer.reset_password_link(@user).deliver_now
    
  end
end
