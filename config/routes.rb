Rails.application.routes.draw do
  resources :deposits

  devise_for :users, :controllers => { registrations: 'registrations' }
  get 'dashboard/index'
  root'home#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
