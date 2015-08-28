Rails.application.routes.draw do
  devise_for :users do
    get 'sign_out' => 'devise/session#destroy'
  end
resources :articles do
resources :comments
end
root 'articles#new'
end
