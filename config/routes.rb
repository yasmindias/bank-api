Rails.application.routes.draw do
  post 'api/auth', to: 'authentication#authenticate'

  get 'api/balance/:id', to: 'account#balance'

  post 'api/transfer', to: 'transaction#create'
  get  'api/transfer/:id', to: 'transaction#show'
  delete 'api/transfer/:id', to: 'transaction#destroy'

  scope :api do
    resources :user, :account
  end
end
