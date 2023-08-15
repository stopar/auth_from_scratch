class SessionsController < ApplicationController
  def destroy

  end

  def create
    flash[:notice] = "Welcome #{current_user.email}"
    redirect_to root_path
  end

  private

    def current_user
      User.find_by(email: params[:email], password: params[:password])
    end
end
