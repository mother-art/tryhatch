Rails.application.routes.draw do
  resources :search
  root "search#index"
end