Rails.application.routes.draw do
  devise_for :artists
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root 'pages#index'

  # devise_for :artists, :controllers => {
  #   :registrations => 'artists/registrations',
  #   :sessions => 'artists/sessions'
  # }

  resources :lives, only: [] do
    get '/', action: :index
  end

  resources :artists, only: [] do
    get '/', action: :index
    resources :items, only: [:index]
  end

  resources :items, only: [:show] do
  end
end
