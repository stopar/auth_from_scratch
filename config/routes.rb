Rails.application.routes.draw do
  get "/registration", to: "registrations#new", as: :sign_up
  post "/registration", to: "registrations#create", as: :registration
  delete "/sign_out", to: "sessions#destroy", as: :sign_out
  get "/sign_in", to: "sessions#new", as: :sign_in
  post "/sign_in", to: "sessions#create", as: :sign_in_create
  root "site#index"
end
