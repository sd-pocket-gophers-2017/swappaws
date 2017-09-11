Rails.application.routes.draw do
  root 'pets#index'
  devise_for :users
  get '/profile' => 'users#show', :as => :profile
  get '/success' => 'events#success'
  # put '/events/:id/book' => 'events#book_event'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :events do
    put :book, on: :member
  end

  resources :pets

  resources :events do
    resources :reviews, shallow: true
  end
end
