Rails.application.routes.draw do

  resources :topics, only: [:index, :show]
  devise_for :users, path:'', path_names: { sign_in: 'login', sign_out:'logout', sign_up: 'register'}
  namespace :api do
    resources :portfs
  end
  resources :portfs, except: [:show] do
    put :sort, on: :collection
  end
  get 'portf/:id', to: 'portfs#show', as: 'portf_show'


  get 'aboutme', to: 'pages#about'
  get 'contact', to: 'pages#contact'
  get 'tech-news', to: 'pages#tech_news'



  resources :blogs do
    member do
      get :toggle_status
    end
  end
  mount ActionCable.server => '/cable'
  root to: 'pages#home'
end
