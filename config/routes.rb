Rails.application.routes.draw do
  devise_for :users do
    get 'sign_out' => 'devise/session#destroy'
  end
resources :articles do
resources :comments
get '/comments/new/(:parent_id)', to: 'comments#new', as: :new_comment
end
root 'articles#index'
end
