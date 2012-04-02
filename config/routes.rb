Quippertasks::Application.routes.draw do
  devise_for :users
  resources :tasks

  match ':page', :to => "pages#show", :as => "page"

  root :to => "pages#index"
end