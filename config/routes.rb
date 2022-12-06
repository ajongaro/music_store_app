Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get '/stores', to: 'stores#index'
  post '/stores/', to: 'stores#create'
  get '/stores/new', to: 'stores#new'

  get '/stores/:id', to: 'stores#show'
  patch '/stores/:id/', to: 'stores#update'
  delete '/stores/:id/', to: 'stores#destroy'
  get '/stores/:id/edit', to: 'stores#edit'

  get '/stores/:id/instruments', to: 'stores/instruments#index'
  get '/stores/:id/instruments/new', to: 'stores/instruments#new'
  get '/stores/:id/instruments/sort', to: 'stores/instruments#index'
  post '/stores/:id/instruments', to: 'stores/instruments#create'
  
  get '/instruments/', to: 'instruments#index'
  get '/instruments/:id', to: 'instruments#show'
  patch '/instruments/:id', to: 'instruments#update'
  get '/instruments/:id/edit', to: 'instruments#edit'
end
