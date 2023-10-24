require 'rails_helper'

# THIS TEST IS NOT COMPLETE!
# See spec/system/forgot_spec.rb for a complete set of tests that follows L9 assignment requirements.

RSpec.describe "Reset Password Email", type: :request do

  describe "GET /forgot" do 
    it "fill in the forgot password" do 
      get forgot_path
      expect(response).to have_http_status(200)
    end
  end 
  
  describe "POST /forgot" do
    
    it "fill in the forgot password" do 
      user = create(:user)
      user_email_params = { email: "joe@home.com" }
      get forgot_path
      post forgot_password_path, params: user_email_params
      expect(response).to have_http_status(302)
    end
    
    it "send reset password email token link" do
      user = create(:reset_password)
      @email = UsersMailer.reset_password_link(user)
      post forgot_password_path, params: { email: "joe@home.com" } 
      expect(@email).to deliver_to(user.email)
      expect(@email).to have_body_text("Hi joe@home.com")
    end
  end
end
