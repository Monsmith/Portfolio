Rails.application.routes.draw do
  devise_for :users, path:'', path_names: { sign_in: 'login', sign_out:'logout', sign_up: 'register'}
  resources :portfs, except: [:show] do
    put :sort, on: :collection
  end
  get 'portf/:id', to: 'portfs#show', as: 'portf_show'


  get 'aboutme', to: 'pages#about'
  get 'contact', to: 'pages#contact'



  resources :blogs do
    member do
      get :toggle_status
    end
  end
  root to: 'pages#home'
end
