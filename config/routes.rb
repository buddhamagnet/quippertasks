Quippertasks::Application.routes.draw do
  devise_for :users

  match ':page', :to => "pages#show", :as => "page"

  root :to => "pages#index"
end