Rails.application.routes.draw do
  resources :uploads
  root "pages#home"
end
