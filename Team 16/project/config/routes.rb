Rails.application.routes.draw do
  root :to => 'welcome#index'
  post 'user', to: 'user#create' # headers => username, password
  get 'user', to: 'user#find_specific' # headers => username
  get 'users', to: 'user#find_all' # headers =>
end
