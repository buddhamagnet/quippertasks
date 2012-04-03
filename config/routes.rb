Quippertasks::Application.routes.draw do
  devise_for :users
  
  resources :tasks do
    collection do
      get 'expired'
    end
  end

  match ':page', :to => "pages#show", :as => "page"

  root :to => "pages#index"
end