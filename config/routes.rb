Rails.application.routes.draw do
  post 'api/auth', to: 'authentication#authenticate'
  get 'api/balance/:id', to: 'account#balance'
  post 'api/transfer', to: 'transaction#create'

  scope :api do
    resources :user, :account, :transaction
  end
end
