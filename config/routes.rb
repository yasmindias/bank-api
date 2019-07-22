Rails.application.routes.draw do
  post 'api/auth', to: 'authentication#authenticate'
  get 'api/balance/:id', to: 'account#balance'

  scope :api do
    resources :user, :account, :transaction
  end
end
