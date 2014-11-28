Rails.application.routes.draw do
  root 'news#index'
  resources :sources
  resources :news, only: [:index, :show]
  resource  :sessions, only: [:new, :create, :destroy]
  get 'sources/:id/refresh', to: 'sources#refresh',  as: 'refresh'
  get 'refresh_all',         to: 'news#refresh_all', as: 'refresh_all'
  get 'news/search',         to: 'news#search',      as: 'search'
end
