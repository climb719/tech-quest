Rails.application.routes.draw do
  root "sessions#home"

  get '/auth/google_oauth2/callback' => 'sessions#omniauth'

  get '/signup' => 'users#new'
  post '/signup' => 'users#create'
 
  get '/login' => 'sessions#new'
  post '/login'  => 'sessions#create'

  delete '/logout' => 'sessions#destroy'

  resources :comments

  resources :categories do
    resources :interview_questions, only: [:new, :create, :index] 
  end

  resources :interview_questions do
    resources :comments, only: [:new, :create, :index]
  end
  
  resources :users do
    resources :interview_questions, only: [:index]
  end
 
end
