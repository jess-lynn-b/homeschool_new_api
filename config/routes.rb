Rails.application.routes.draw do
  #hour_tracking
  resources :hours 

  # Nested for users and profiles
  resources :users, except: [:index, :destroy] do
    # resource :profile, only: [:show, :edit, :update]
    post 'upload_image', to: 'users#upload_image', on: :member

  end

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  get "up" => "rails/health#show", as: :rails_health_check
  # Defines the root path route ("/")
  # root "posts#index"

# Routes for login and signup
  post '/login', to: 'sessions#login'
  post '/sign_up', to: 'users#create'

 # Route for showing user profile by username
 get '/profile', to: 'profile#show'

 # Route for updating user profile by username
 patch '/users/:username/edit', to: 'users#update', as: :edit_user_profile

 # Route for deleting user profile by username
 delete '/users/:username', to: 'users#destroy', as: :delete_user_profile

 # Route for retrieving all hour_trackings
#  get '/hours', to: 'hours#index'

 # Add a route for uploading image to Awards controller (if Awards controller exists)
 post '/users/:username/upload_image', to: 'awards#upload_image'

 # Define your other application routes here...
end
