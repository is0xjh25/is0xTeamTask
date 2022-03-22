Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: 'home#index'
  resources :members, only: [:index, :show, :new, :create, :edit, :update, :destroy]
  resources :tasks, only: [:index, :show, :new, :create, :edit, :update, :destroy]
  post 'participants/add_member'
  post 'participants/remove_member'
end
