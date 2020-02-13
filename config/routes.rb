# frozen_string_literal: true

Rails.application.routes.draw do
  resources :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  # root :to => 'home#index'
  root 'home#index'
  # get 'book/index'
  resources :books
  resources :categories, :book_orders
end
