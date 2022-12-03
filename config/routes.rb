Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get '/stores', to: 'stores#index'
  get '/stores/:id', to: 'stores#show'
  get '/stores/:id/instruments', to: 'stores/instruments#index'

  get '/instruments/', to: 'instruments#index'
  get '/instruments/:id', to: 'instruments#show'
end
