Rails.application.routes.draw do
  root to: 'login#login.html' # di defualt mi manda al welcome index

  post 'user', to: 'user#create' # headers => username, password. Post a user (localhost). "to:" richiama la classe usercontroller e la funzione create
  get 'user', to: 'user#find_specific' # headers => username.
  get 'users', to: 'user#find_all' # headers =>
  delete 'user', to: 'user#delete' # headers => username.

  post 'company', to: 'company#create' # headers => companyName, vatNumber
  get 'company', to: 'company#find_specific' # headers => companyName, vatNumber
  get 'companies', to: 'company#find_all' # headers =>
  delete 'company', to: 'company#delete' # headers => companyName, vatNumber

  post 'activity', to: 'activity#create' # headers => username, vatNumber, startTime, endTime
  get 'activity', to: 'activity#find_specific' # headers => username, vatNumber, startTime, endTime
  get 'activities', to: 'activity#find_all' # headers =>
  delete 'activity', to: 'activity#delete' # headers => username, vatNumber, startTime, endTime
end
