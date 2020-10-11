Rails.application.routes.draw do
  # resources :book_checkout_histories
  resource :auth, :only => [:show, :create, :destroy], controller: 'auth'
  resources :books do
    collection do
      resources :import, :only => [:create], module: 'books'
    end
    resource :checkout, :only => [:index, :update], module: 'books'
    resources :checkout_history, module: 'books'
  end
  resources :libraries do
    collection do
      resources :name, param: :name, :only => [:show]
    end
  end
  resources :library_user, :only => [:create, :destroy]
  resources :users do
    resources :activation, :only => [:update], module: 'users'
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
