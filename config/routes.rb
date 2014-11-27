Rails.application.routes.draw do
  get 'sessions/new'

  root 'news#index'
  resources :sources
  resources :news, only: [:index]
  resource  :sessions, only: [:new, :create, :destroy]
  get 'sources/:id/refresh', to: 'sources#refresh',  as: 'refresh'
  get 'news/refresh_all',    to: 'news#refresh_all', as: 'refresh_all'
end
