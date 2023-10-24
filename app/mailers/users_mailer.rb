class UsersMailer < ApplicationMailer
  
  require 'pry'

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.users_mailer.forgot_password.subject
  #
  def reset_password_link(user)
    @user = user
    
    mail to: @user.email, subject: "Reset password for #{@user.email}"
    
    # binding.pry
  end
end
