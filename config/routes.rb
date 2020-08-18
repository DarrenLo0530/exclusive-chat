Rails.application.routes.draw do
  devise_for :members
  resources :posts, only: [:index, :new, :create]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root to: "posts#index"
end
