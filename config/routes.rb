Rails.application.routes.draw do
  root 'pets#index'
  devise_for :users
  resources :users
  get '/profile' => 'users#show', :as => :profile
  put '/profile' => 'users#update_photo'

  get '/success' => 'events#success'
  # put '/events/:id/book' => 'events#book_event'

  resources :pets

  # get '/success' => 'events#success'
  get '/purchase' => 'users#purchase'
  patch '/update_tokens' => 'users#update_tokens'

  resources :events do
    resources :reviews, shallow: true
    put :book, on: :member
    get :success, on: :member
  end
end
