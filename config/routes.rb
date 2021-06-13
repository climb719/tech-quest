Rails.application.routes.draw do
  root "sessions#home"

  get '/signup' => 'users#new'
  post '/signup' => 'users#create'

  resources :comments
  resources :positions
  resources :interview_questions
  resources :users 
  #routes order matters so custom routes don't get associated with an id
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
