Rails.application.routes.draw do
  scope :api do
    resources :user
  end
end
