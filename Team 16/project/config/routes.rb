Rails.application.routes.draw do
  post 'user', to: 'user#create'
  get 'user', to: 'user#find_specific' # headers => username
  get 'users', to: 'user#find_all' # headers =>
end
