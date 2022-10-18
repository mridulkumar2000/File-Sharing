Rails.application.routes.draw do
  root 'sessions#create'

  get '/signup' => 'users#new'
  post '/signup' => 'users#create'
  get '/profile' => 'users#show', :as => :user 
  get '/profile/edit' => 'users#edit'
  patch '/profile' => 'users#update'

  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'
  delete '/logout' => 'sessions#destroy'
  
end
