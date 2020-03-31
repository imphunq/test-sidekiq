require 'sidekiq/web'
Rails.application.routes.draw do
  resources :users
  mount Sidekiq::Web, at: '/sidekiq'
end
