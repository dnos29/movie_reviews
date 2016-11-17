Rails.application.routes.draw do
  resources :user_roles
  get 'user_roles/index'

  resources :roles
  resources :user_groups
  post '/rate' => 'rater#create', :as => 'rate'
  get '/not_found' => 'homes#not_found'
  get '/test_mobile' => 'homes#test_mobile'
  resources :reviews, except: [:show, :index]
  devise_for :users
  root 'homes#index'
  resources :movies do
    collection do
      get 'search'
    end
    resources :reviews, except: [:show, :index]
  end
   resource :user_roles
  # get '/user_roles' => "user_roles#index"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
