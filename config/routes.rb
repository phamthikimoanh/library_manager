# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :users , path: '', path_names: { 
    sign_in: 'login',
    sign_out: 'logout',
    registration: 'register'
  }
  root 'home#index'
  resources :categories, :book_orders, :books
  resources :book_cards
  # resource :users, only: [:index, :show, :edit] 
  resource :user, only: [:edit] do
  collection do
    patch 'update_user'
  end
end
end
