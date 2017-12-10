Rails.application.routes.draw do
  root to: 'login#login.html' # di defualt mi manda al welcome index
  get 'userMain', to: 'welcome#index.html' # di defualt mi manda al welcome index
  get 'adminMain', to: 'admin#admin.html'
  get 'companyMain', to: 'company#index.html'

  post 'user', to: 'user#create' # headers => username, password.
  get 'user', to: 'user#find_specific' # headers => username.
  get 'users', to: 'user#find_all' # headers =>
  delete 'user', to: 'user#delete' # headers => username.

  post 'company', to: 'company#create' # headers => companyName, vatNumber
  get 'company', to: 'company#find_specific' # headers => companyName, vatNumber
  get 'companies', to: 'company#find_all' # headers =>
  get 'company/by/id', to: 'company#find_by_id' # headers =>
  get 'company/work/amount', to: 'company#company_user_work_amount' # headers =>companyName
  delete 'company', to: 'company#delete' # headers => companyName, vatNumber

  post 'activity', to: 'activity#create' # headers => username, vatNumber, startTime, endTime
  get 'activity', to: 'activity#find_specific' # headers => username, vatNumber, startTime, endTime
  get 'activities', to: 'activity#find_all' # headers =>
  get 'activities/by/user', to: 'activity#find_by_user' # headers => username
  get 'activities/by/company', to: 'activity#find_by_company' # headers => companyName
  delete 'activity', to: 'activity#delete' # headers => username, vatNumber, startTime, endTime

  post 'signinUser', to: 'login#sign_in_user' # headers => username, password.
  post 'loginUser', to: 'login#log_in_user' # headers => username, password.
  post 'signinCompany', to: 'login#sign_in_company' # headers => username, password.
  post 'loginCompany', to: 'login#log_in_company' # headers => username, password.
end
