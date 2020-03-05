# frozen_string_literal: true

Rails.application.routes.draw do
  resources :categories
  devise_for :users , path: '', path_names: { 
    sign_in: 'login',
    sign_out: 'logout',
    registration: 'register'
  }
  root 'home#index'
  resources :categories, :books, :book_cards
  resources :book_orders 
  # resource :users, only: [:index, :show, :edit] 
  resource :user, only: [:edit] do
    collection do
      patch 'update_user'
    end
  end
end
