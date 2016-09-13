Rails.application.routes.draw do


  resources :members
  get 'home/index'

   root :to => "home#index"
  get 'home/setimage', to: "home#setimage"
  get 'home/getimage/:id', to: "home#getimage", as: 'getimage'
  get 'home/testimage', to: "home#testimage"


  # *MUST* come *BEFORE* devise's definitions (below)
  as :user do
    match 'user/confirmation' => 'confirmations#update', :via => :put, :as => :update_user_confirmation
  end

  devise_for :users, :controllers => {
    :registrations => "milia/registrations",
    :confirmations => "confirmations",
    :sessions => "milia/sessions",
    :passwords => "milia/passwords",
  }


end
