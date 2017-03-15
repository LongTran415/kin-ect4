Rails.application.routes.draw do


  resources :sessions, only: [:new, :create, :destroy]

  resources :categories, only: [:index, :show] do
    resources :games, only: [:index, :show]
  end

  # games/results

  resources :games, only: [:index, :show, :create] do
    resources :comments do
      resources :votes, except: [:index, :destroy]
    end
    resources :votes, except: [:index, :destroy]
    resources :subscriptions, only: [:new, :create, :destroy]
    # need to update votes
    resources :users
  end

  resources :users, except: [:index] do
    resources :comments do
      resources :votes, except: [:index, :destroy]
    end
    resources :votes, except: [:index, :destroy]
    resources :games, except: [:edit, :update] do
      resources :subscriptions, only: [:new, :create, :destroy]
    end
    resources :friends, except: [:edit, :update]
  end

  resources :games do
    member do
      post 'upvote'
    end
  end

  resources :comments do
    member do
      post 'upvote'
    end
  end

  resources :games do
    member do
      post 'downvote'
    end
  end

  resources :comments do
    member do
      post 'downvote'
    end
  end

  root 'games#index'
  post "/games" =>'games#search'

  # these routes are for showing users a login form, logging them in, and logging them out.
  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'
  get '/logout' => 'sessions#destroy'

  get '/signup' => 'users#new'
  post '/users' => 'users#create'

  post '/users/:id/friendship' => 'users#friendship'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
