Sebastian::Application.routes.draw do
  devise_for :users, :controllers => { :omniauth_callbacks => 'omniauth_callbacks' }

  devise_scope :user do
    get 'sessions/sign_out', :to => 'devise/sessions#destroy', :as => :sign_out
  end

  authenticated :user do
    root :to => "repositories#index"
  end

  root :to => "application#welcome"

  resource :user, :only => :show

  constraints :owner_name => /[^\/]+/, :name => /[^\/]+/ do
    get  ':owner_name/:name',             :to => 'builds#show',   :as => :repository
    post ':owner_name/:name',             :to => 'repositories#create'

    # status image
    get  ':owner_name/:name/status',      :to => 'repositories#status'

    get  ':owner_name/:name/builds/:id',  :to => 'builds#show', :as => :build
  end
end
