# frozen_string_literal: true

Rails.application.routes.draw do
  resources :movies do
    resources :reviews, only: %i[new create]
  end

  root 'movies#index'
end
