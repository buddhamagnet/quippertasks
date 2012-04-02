Quippertasks::Application.routes.draw do
  match ':page', :to => "pages#show", :as => "page"

  root :to => "pages#index"
end