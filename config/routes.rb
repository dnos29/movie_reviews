Rails.application.routes.draw do
  post '/rate' => 'rater#create', :as => 'rate'
  resources :reviews, except: [:show, :index]
  devise_for :users
  root 'homes#index'
  resources :movies do
    collection do
      get 'search'
    end
    resources :reviews, except: [:show, :index]
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
