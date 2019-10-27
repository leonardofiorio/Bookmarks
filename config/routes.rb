Rails.application.routes.draw do
  devise_for :usuarios
  resources :favoritos

  root to: "favoritos#index"

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
