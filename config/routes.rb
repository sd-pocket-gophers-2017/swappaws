Rails.application.routes.draw do
  root 'pets#index'
  devise_for :users
  get '/profile' => 'users#show', :as => :profile

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :events
  resources :pets

end
