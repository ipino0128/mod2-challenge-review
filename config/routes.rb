Rails.application.routes.draw do
  get '/bikes', to: 'bikes#index'
  get '/bikes/new', to: 'bikes#new'
  get '/bikes/:id', to: 'bikes#show', as: 'bike'
  post '/bikes', to: 'bikes#create'

  get '/users', to: 'users#index'
  get '/users/new', to: 'users#new'
  post '/users', to: 'users#create'
  get '/users/:id', to: 'users#show', as: 'user'
  get '/users/:id/edit', to: 'users#edit', as: 'edit_user'
  patch '/users/:id', to: 'users#update', as: 'update_user'
  delete '/users/:id', to: 'users#destroy', as: 'delete_and_destroy_user'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
