Rails.application.routes.draw do
root 'static_pages#home'

get '/help', to: "static_pages#help"
get '/about', to: "static_pages#about"
get '/contact', to:"static_pages#contact"

get '/signup', to: 'users#new'
post '/signup', to: 'users#create'

get    '/login',   to: 'sessions#new'
post   '/login',   to: 'sessions#create'
delete '/logout',  to: 'sessions#destroy'

 get "mailbox/inbox", to: "mailbox#inbox", as: :mailbox_inbox
  get "mailbox/sent", to: "mailbox#sent", as: :mailbox_sent
  get "mailbox/trash", to: "mailbox#trash", as: :mailbox_trash

resources :users do
	member do
		get :watching, :watchers
	end
end

resources :requests, only: [:create, :destroy]
resources :relationships, only: [:create, :destroy]

  resources :conversations do
    member do
      post :reply
      post :trash
      post :untrash
    end
   end


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
