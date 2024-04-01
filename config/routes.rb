Rails.application.routes.draw do
  resources :users do
     post 'upload_image', to: 'users#upload_image'

     resources :hour_trackings, only: [:create]
  end

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check
  # Defines the root path route ("/")
  # root "posts#index"
  post '/login', to: 'sessions#login'
  post '/sign_up', to: 'users#create'
#resources :todos
  scope '/users' do
    get '/:username', to: 'users#show'

    post '/sign_up', to: 'users#create'

    put '/:username/edit', to: 'users#update'

    delete '/:username', to: 'users#destroy'

    #need to add the path to upload an image to the Awards controller.... then test in postman
  end
end
