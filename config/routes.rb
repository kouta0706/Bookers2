Rails.application.routes.draw do
  devise_for :users
  # root "/"
  root to: 'books#top'
  get "books/top"
  get "books/about"
  resources :books
  resources :users
  resources :post_images, only:[:new,:create,:index,:show]



end
