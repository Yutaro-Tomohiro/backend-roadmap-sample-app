Rails.application.routes.draw do
  namespace :v0 do
    resources :users, except: [:index, :destroy] do
      resources :posts
    end
  end
end
