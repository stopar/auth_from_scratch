class SessionsController < ApplicationController
  def destroy

  end

  def create
    flash[:notice] = "Welcome #{user.email}"
    redirect_to root_path
  end

  private

    def user
      User.find_by(email: params[:email])
        &.authenticate(params[:password])
    end
end
