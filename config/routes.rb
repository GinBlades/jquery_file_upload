Rails.application.routes.draw do
  get 'angular' => 'demos#angular'
  get 'basic' => 'demos#basic'
  get 'basic_plus' => 'demos#basic_plus'
  get 'basic_plus_ui' => 'demos#basic_plus_ui'
  get 'jquery_ui' => 'demos#jquery_ui'

  resources :uploads
  root "pages#home"
  get "angular" => "pages#angular"
end
