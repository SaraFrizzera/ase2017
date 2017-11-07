Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get 'welcome/index'
  root 'welcome#index'

  get 'user/create', to: 'user#create'

  get 'user/find', to: 'user#find'
end
