class AccountController < ApplicationController
  skip_before_action :authenticate_request, only: [:create]
  before_action :find_account, except: [:index, :create]
  before_action :find_user, only: [:create]

  def index
    accounts = Account.order('id')
    render json: accounts.to_json(except:[:password_digest]), status: :ok
  end

  def show
    render json: @account, status: :ok
  end

  def create
    if Account.find_by(branch: account_params[:branch], number: account_params[:number])
      render json: {status: 400, errors: "This account already exists."}, status: :bad_request
    else
      account = Account.new(account_params)
      if account.save
        Transaction.create({transaction_id: Transaction.defineTransactionId, transaction_type: "DEPOSIT",
                                      account_id: account.id, amount: params[:deposit]})
        render json: account, status: :created
      end
    end
  end

  def destroy
    if @account.destroy
      render json: {message: "Account deleted."}, status: :ok
    else
      render json: {status: 402, errors: @account.errors}, status: :unprocessable_entity
    end
  end

  def update
    if @account.update_attributes(account_params)
      render json: @account, status: :ok
    else
      render json: {status: 402, errors: @account.errors}, status: :unprocessable_entity
    end
  end

  def balance
    render json: {account_id: @account.id, balance: @account.get_balance}, status: :ok
  end

  private
  def account_params
    params.permit(:branch, :number, :digit, :user_id, :password)
  end

  def find_account
    begin
      @account = Account.find(params[:id])
    rescue => errors
      render json: {status: 404, error: errors.message}, status: :not_found
    end
  end

  def find_user
    begin
      @user = User.find(params[:user_id])
    rescue => errors
      render json: {status: 404, error: errors.message}, status: :not_found
    end
  end
end
