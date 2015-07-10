Rails.application.routes.draw do
  resources :uploads
  root "pages#home"
  get "angular" => "pages#angular"
end
