class AccountController < ApplicationController
  skip_before_action :authenticate_request, only: [:create]
  before_action :find_account, only: [:show, :destroy, :update]
  before_action :find_user, only: [:create]

  def index
    accounts = Account.order('created_at DESC')
    render json: accounts, status: :ok
  end

  def show
    render json: @accounts, status: :ok
  end

  def create
    account = Account.new(account_params)
    if account.save
      render json: account, status: :created
    else
      render json: {status: 402, errors: account.errors}, status: :unprocessable_entity
    end
  end

  def destroy
    if @accounts.destroy
      render json: {message: "Account deleted."}, status: :ok
    else
      render json: {status: 402, errors: @accounts.errors}, status: :unprocessable_entity
    end
  end

  def update
    if @accounts.update_attributes(account_params)
      render json: @accounts, status: :ok
    else
      render json: {status: 402, errors: @accounts.errors}, status: :unprocessable_entity
    end
  end

  private
  def account_params
    params.permit(:branch, :number, :digit, :balance, :user_id, :password)
  end

  def find_account
    @accounts = Account.find(params[:id])
  end

  def find_user
    @user = User.find(params[:user_id])
  end
end
