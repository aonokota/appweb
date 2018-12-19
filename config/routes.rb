Rails.application.routes.draw do
  resources :answers
  resources :questions
  root 'questions#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
