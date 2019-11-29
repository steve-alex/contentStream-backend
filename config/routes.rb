Rails.application.routes.draw do
  get '/auth/mastodon/callback', to: 'application#mastodon'

  namespace :api do
    namespace :v1 do
      resources :users, only: [:create]
    end
  end
end
