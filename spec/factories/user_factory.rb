FactoryBot.define do 
  factory :user do 
    email { "joe@home.com" }
    password_digest { "some_password" }
    
    factory :reset_password do 
      password_reset_token { "a_reset_link" }
      password_reset_sent_at { 20.minutes.ago }
    end
  end
end 