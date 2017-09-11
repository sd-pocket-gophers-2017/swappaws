Rails.application.routes.draw do
  root 'pets#index'
  devise_for :users
  resources :users
  get '/profile' => 'users#show', :as => :profile
  # get '/success' => 'events#success'
  get '/purchase' => 'users#purchase'
  patch '/update_tokens' => 'users#update_tokens'
  resources :events do
    put :book, on: :member
    get :success, on: :member
  end
  resources :pets

end
