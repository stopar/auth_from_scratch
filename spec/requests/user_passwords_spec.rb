require "rails_helper"

RSpec.describe "User passwords", type: :request do
  describe "POST /registration" do
    it "encrypts the user's password" do
      user_params = { user: { email: "jdoe@email.com", password: "secret123" } }
      post registration_path, params: user_params
      expect(response).to have_http_status(302)
      expect(User.last.password_digest).not_to be_nil
    end
  end
end
