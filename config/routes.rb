Rails.application.routes.draw do
  devise_for :users, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks"}
  root 'courses#index'
  resources :courses, :only => [:index, :show]
  resources :class_periods, :only => [:show, :update, :update_course_hash]
  resources :questions, :only => [:index, :show, :update]
  resources :data, :only => [:index]
  resources :admin, :only => [:index]
  resources :clusters, :only => [:show]
  resources :match, :only => [:index, :show]
  patch '/admin', to: 'admin#update'
  get   '/update_course_hash/:id', to: 'class_periods#update_course_hash'
end
