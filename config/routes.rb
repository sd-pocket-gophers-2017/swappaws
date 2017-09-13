Rails.application.routes.draw do
  root 'pets#index'
  devise_for :users
  resources :users
  get '/profile' => 'users#show', :as => :profile

  get '/success' => 'events#success'
  # put '/events/:id/book' => 'events#book_event'

  resources :pets

  # get '/success' => 'events#success'
  get '/purchase' => 'users#purchase'
  patch '/update_tokens' => 'users#update_tokens'
  # get '/confirmation' => 'events#confirmation'

  resources :events do
    resources :reviews, shallow: true
    resources :requests, shallow: true
    put :book, on: :member
    get :success, on: :member
    get :confirmation, on: :member
    resources :requests do
      get :request_confirmation, on: :member
    end
  end
end
