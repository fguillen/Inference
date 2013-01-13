Inference::Application.routes.draw do
  resources :dashboards

  root :to => "widgets#index"
  resources :widgets, :only => [:index, :edit, :update, :new, :create, :destroy]
  resources :dashboard_lattices, :only => [:create, :destroy]
end
