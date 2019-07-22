class AuthenticationController < ApplicationController
  skip_before_action :authenticate_request

  def authenticate
    command = AuthenticateUser.call(params[:branch], params[:number], params[:password])

    if command.success?
      render json: { auth_token: command.result }
    else
      render json: { status: 401, error: command.errors }, status: :unauthorized
    end
  end
end
