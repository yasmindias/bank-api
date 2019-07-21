Rails.application.routes.draw do
  post 'api/auth', to: 'authentication#authenticate'

  scope :api do
    resources :user, :account
  end
end
