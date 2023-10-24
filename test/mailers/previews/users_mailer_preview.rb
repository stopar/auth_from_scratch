# Preview all emails at http://localhost:3000/rails/mailers/users_mailer
class UsersMailerPreview < ActionMailer::Preview

  # Preview this email at http://localhost:3000/rails/mailers/users_mailer/forgot_password
  def forgot_password
    UsersMailer.forgot_password
  end

end
