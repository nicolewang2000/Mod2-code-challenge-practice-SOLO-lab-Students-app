Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  resources :instructors, only: [:index, :show]
  resources :students, only: [:index, :new, :show, :create, :edit, :update]

end
