Rails.application.routes.draw do
  get "/registration", to: "registrations#new", as: :sign_up
  post "/registration", to: "registrations#create", as: :registration
  
  delete "/sign_out", to: "sessions#destroy", as: :sign_out
  get "/sign_in", to: "sessions#new", as: :sign_in
  post "/sign_in", to: "sessions#create", as: :sign_in_create
  
  get "/forgot", to: "forgots#new", as: :forgot
  post "/forgot", to: "forgots#create", as: :forgot_password
  
  get "/reset_password/:password_reset_token/edit", to: "forgots#edit", as: :reset_password
  post "/reset_password/:password_reset_token", to: "forgots#update", as: :reset
  
  root "site#index"
end
