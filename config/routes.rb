Rails.application.routes.draw do
  resources :causes
  root 'causes#index'
  devise_for :users, controllers: {registrations: 'users/registrations'}
  devise_for :lawyers, controllers: {registrations: 'lawyers/registrations'}
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
