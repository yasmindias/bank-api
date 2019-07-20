class Account < ApplicationRecord
  belongs_to :user

  before_action :find_user, only: [:show, :destroy, :update]

  def index
    users = User.order('created_at DESC')
    render json: users, status: :ok
  end

  def show
    render json: @user, status: :ok
  end

  def create
    user = User.new(user_params)
    if user.save
      render json: user, status: :created
    else
      render json: {errors: user.errors}, status: :unprocessable_entity
    end
  end

  def destroy
    if @user.destroy
      render json: {message: "User deleted."}, status: :ok
    else
      render json: {errors: @user.errors}, status: :unprocessable_entity
    end
  end

  def update
    if @user.update_attributes(user_params)
      render json: {user: @user}, status: :ok
    else
      render json: {errors: @user.errors}, status: :unprocessable_entity
    end
  end

  private
  def user_params
    params.require(:user).permit(:name, :tax_document, :email)
  end

  def find_user
    @user = User.find(params[:id])
  end
end
