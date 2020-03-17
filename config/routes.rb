# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :users
  get 'articles/index'
  root 'articles#index'
  resources :articles do
    resources :comments
  end
end
