Rails.application.routes.draw do
  resources :portfs, except: [:show]
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
