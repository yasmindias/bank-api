Rails.application.routes.draw do
  scope :api do
    resources :user, :account

    post 'auth', to: 'authentication#authenticate'

    get 'balance/:id', to: 'account#balance'

    post 'transfer', to: 'transaction#create'
    get  'transfer/:id', to: 'transaction#show'
    delete 'transfer/:id', to: 'transaction#destroy'
  end
end
