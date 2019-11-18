Rails.application.routes.draw do
  resources :events, path: '/api/events'

  root 'home#index'
end
