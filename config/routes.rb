Rails.application.routes.draw do
  root "sessions#home"

  get '/auth/google_oauth2/callback', to 'sessions#omniauth'

  get '/signup' => 'users#new'
  post '/signup' => 'users#create'

  #login - 2 routes - display login and process
  get '/login' => 'sessions#new'
  post '/login'  => 'sessions#create'

  #logout route - delete since deleting the session
  delete '/logout' => 'sessions#destroy'

  resources :users 
  resources :comments

  resources :categories do
    resources :interview_questions, only: [:new, :create, :index] 
  end
  resources :interview_questions do
    resources :comments, only: [:new, :create, :index] 
  end

  #routes order matters so custom routes don't get associated with an id
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
