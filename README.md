# README

For Mix-and-Go L9 assignment on Reset password link.

* bundle install

* rails db:migrate

* rspec rspec

The actual test is written in Rspec System Test at spec/system/forgot_spec.rb
I implemented an extra check on the reset link token by having a check on the token must need to be valid within 30 minutes