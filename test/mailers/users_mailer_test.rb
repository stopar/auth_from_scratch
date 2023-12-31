require "test_helper"

class UsersMailerTest < ActionMailer::TestCase
  test "forgot_password" do
    mail = UsersMailer.forgot_password
    assert_equal "Forgot password", mail.subject
    assert_equal ["to@example.org"], mail.to
    assert_equal ["from@example.com"], mail.from
    assert_match "Hi", mail.body.encoded
  end

end
