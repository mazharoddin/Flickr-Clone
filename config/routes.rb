Flicker::Application.routes.draw do
  devise_for :users
  root :to => "Root#root" 
  resource :account
  get '/photos/upload', to: 'Photos#upload' 
  resources :photostreams, :only => [:index, :show, :edit]
  resources :photos, :only => [:create, :show, :destroy] do
    collection do
      put :upload_multiple
      delete :delete_multiple
      get :delete_unsaved
    end
  end
  resources :collections do
    collection do
      get :user_collections
    end
  end
  resources :favorites
  resources :friendships
  resources :contacts
  resources :tags, :only => [:index]
  post '/delete_favorite', to: 'Favorites#destroy'
  post '/unfriend', to: 'Friendships#destroy'
end