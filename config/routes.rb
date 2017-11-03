Rails.application.routes.draw do
  devise_for :users, :controllers => { registrations: 'registrations' }
  get 'dashboard/index'
  root'home#index'
  resources :deposits

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
