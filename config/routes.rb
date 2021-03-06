Rails.application.routes.draw do
  namespace :v0 do
    resources :users
  end
end
