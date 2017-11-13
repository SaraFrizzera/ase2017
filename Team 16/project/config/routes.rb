Rails.application.routes.draw do # dfault
  root to: 'welcome#index' # di defualt mi manda al welcome index
  post 'user', to: 'user#create' # headers => username, password. Post a user (localhost). "to:" richiama la classe usercontroller e la funzione create
  get 'user', to: 'user#find_specific' # headers => username. 
  get 'users', to: 'user#find_all' # headers =>
  post 'company', to: 'company#create'
end
