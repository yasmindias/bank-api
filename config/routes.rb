Rails.application.routes.draw do
  scope :api do
    resources :user, :account
  end
end
