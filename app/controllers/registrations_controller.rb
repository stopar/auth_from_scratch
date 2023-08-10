class RegistrationsController < ApplicationController
  layout "auth"

  def new
    @user = User.new
  end
end
