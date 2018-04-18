Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :technologies, only: [:index, :create, :show, :update]
      resources :projects
      resources :contracts
      resources :companies, only: [:index, :create, :show, :update]
      resources :schools, only: [:index, :create, :show, :update]
      resources :users
      post '/login', to: 'authentication#create'
      get '/current_user', to: 'authentication#show'
      get '/companies_by_key/:id', to: 'companies#show_by_key'
      get '/schools_by_key/:id', to: 'schools#show_by_key'
    end
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
