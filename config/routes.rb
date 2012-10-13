Sebastian::Application.routes.draw do
  devise_for :users, :controllers => { :omniauth_callbacks => 'omniauth_callbacks' }

  devise_scope :user do
    get 'sessions/sign_out', :to => 'devise/sessions#destroy', :as => :sign_out
  end
  root :to => "application#welcome"
end
