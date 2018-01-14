Rails.application.routes.draw do
  devise_for :users
  get 'welcome/index'

  root 'welcome#index'

  # get 'articles', to: 'articles#index'
  # get 'articles/new', to: 'articles#new', as: 'new_article'
  # post 'articles', to: 'articles#create'

  # get 'articles/:id', to:'articles#show', as: 'article'
  # get 'articles/:id/edit', to:'articles#edit', as: 'edit_article'
  # patch 'articles/:id', to:'articles#update'

  # delete 'articles/:id', to:'articles#destroy'

  resources :articles do 
    member do 
      get :summary
    end
    resources :comments, only: [:create, :destroy]
    resources :likes, only: [:create, :destroy]
  end



  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
