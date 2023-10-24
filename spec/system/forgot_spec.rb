require 'rails_helper'

RSpec.describe "Forgot Password", type: :system do
  
  it "allows user to input email in forgot password page" do
    sign_up
    sign_out
    visit "/"
    click_on "Forgot"
    fill_in "user-email", with: "jdoe@email.com"
    click_on "Submit"
    expect(page).to have_content("Your password reset instruction has been sent to your email jdoe@email.com")
  end
  
  it "allows a user to change password and login with the new password" do
    user = create(:reset_password)
    visit "/reset_password/#{user.password_reset_token}/edit"
    fill_in "password", with: "new_password"
    click_on "Update Password"
    expect(page).to have_content("Password has been reset")
    click_on "user-login"
    fill_in "user-email", with: "joe@home.com"
    fill_in "user-password", with: "new_password"
    click_on "user-login-submit"
    expect(page).to have_content("Welcome joe@home.com")
  end

  it "does not allow user to change their password if reset token has expired" do
    user = create(:reset_password, :password_reset_sent_at => 1.hours.ago)
    visit reset_password_path(user.password_reset_token)
    fill_in "password", with: "new_password"
    click_on "Update Password"
    expect(page).to have_content("Password reset has expired, please redo forgot password")
  end
  
  it "Full test - fill up forgot password page > deliver reset password email > then enter new password > login with new password" do
    sign_up
    sign_out
    visit "/"
    click_on "Forgot"
    fill_in "user-email", with: "jdoe@email.com"
    click_on "Submit"
    expect(page).to have_content("Your password reset instruction has been sent to your email jdoe@email.com")
    open_email("jdoe@email.com")
    visit_in_email("Reset Password")
    expect(page).to have_content("Reset Password")
    fill_in "password", with: "new_password"
    click_on "Update Password"
    expect(page).to have_content("Password has been reset")
    click_on "user-login"
    fill_in "user-email", with: "jdoe@email.com"
    fill_in "user-password", with: "new_password"
    click_on "user-login-submit"
    expect(page).to have_content("Welcome jdoe@email.com")
  end

end