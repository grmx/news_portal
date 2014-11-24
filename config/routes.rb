Rails.application.routes.draw do
  root 'news#index'
  resources :sources
  resources :news, only: [:index]
  get 'sources/:id/refresh', to: 'sources#refresh', as: 'refresh'
end
