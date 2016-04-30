Rails.application.routes.draw do

  root                               'sessions#new'
  get    'about'                  => 'pages#about'

  get    'home/home1'             => 'pages#home1'
  get    'home/home2'             => 'pages#home2'
  get    'home/home3'             => 'pages#home3'

  get    'admin/admin1'           => 'pages#admin1'
  get    'admin/admin2'           => 'pages#admin2'
  get    'admin/admin3'           => 'pages#admin3'
  
  get    'reports/report1'        => 'pages#report1'
  get    'reports/report2'        => 'pages#report2'
  get    'reports/report3'        => 'pages#report3'
  
  get    'reports'                => 'reports#reports'
  get    'reports/donor'          => 'reports#donor'
  get    'reports/truck'          => 'reports#truck'
  
  get    'schedule/schedule1'     => 'pages#schedule1'
  get    'schedule/schedule2'     => 'days#schedule2'
  get    'schedule/schedule3'     => 'pages#schedule3'
  get    'schedule/all'           => 'days#all'
  post   'schedule/create'        => 'days#create'
  
  get    'template'               => 'pages#template'
  get    'login'   => 'sessions#new'
  post   'login'   => 'sessions#create'
  delete 'logout'  => 'sessions#destroy'
  
  get 'users/index'  => 'users#index'

  
  resources :pickups
  resources :users
end
