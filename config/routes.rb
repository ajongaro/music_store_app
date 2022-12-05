Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get '/stores', to: 'stores#index'
  get '/stores/new', to: 'stores#new'
  post '/stores/', to: 'stores#create'

  get '/stores/:id', to: 'stores#show'
  get '/stores/:id/instruments', to: 'stores/instruments#index'

  get '/stores/:id/edit', to: 'stores#edit'
  patch '/stores/:id/', to: 'stores#update'

  get '/instruments/', to: 'instruments#index'
  get '/instruments/:id', to: 'instruments#show'
end
