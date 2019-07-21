class AuthenticateUser
  prepend SimpleCommand

  def initialize(branch, number, password)
    @branch = branch
    @number = number
    @password = password
  end

  def call
    JsonWebToken.encode(account_id: account.id) if account
  end

  private

  attr_accessor :branch, :number, :password

  def account
    account = Account.find_by(branch: @branch, number: @number)
    return account if account && account.authenticate(@password)

    errors.add :account_authentication, 'Invalid credentials.'
    nil
  end
end