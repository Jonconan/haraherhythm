Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root 'pages#index'

  devise_for :artists, :controllers => {
    :registrations => 'artists/registrations',
    :sessions => 'artists/sessions'
  }
  devise_scope :artist do
    get '/artists/sign_out' => 'artists/sessions#destroy', as: :artist_sign_out
  end
  devise_for :users, :controllers => {
    :registrations => 'users/registrations',
    :sessions => 'users/sessions'
  }
  devise_scope :user do
    get '/users/sign_out' => 'users/sessions#destroy', as: :user_sign_out
  end

  resources :events, only: [] do
    get '/', action: :index
  end

  resources :artists, only: [] do
    get '/', action: :index
    get :follow
    get :unfollow

    resources :items, only: [:index]
  end

  resources :items, only: [:show] do
  end

  # マイページ内のURL
  namespace :mypage do
    get '/', action: :index
    get :edit
    post :update

    # イベント登録＆編集
    resources :events, only: [:index, :new, :create, :show, :edit, :update] do
      get :join_event
      get :left_event
    end

    resources :followers, only: [:index] do
    end

    # 商品登録＆編集
    resources :items, only: [:index, :new, :create, :show, :edit, :update] do
    end
  end
end
