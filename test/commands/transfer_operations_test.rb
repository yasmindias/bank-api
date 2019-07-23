require 'test_helper'

class TransferOperationsTest < ActionDispatch::IntegrationTest

  def setup
    User.create({name: "Jane Doe", tax_document: "69443151065", email: "janedoe@emailhost.com"})
    User.create({name: "John Doe", tax_document: "09876543210", email: "john.doe@emailhost.com"})

    cost = ActiveModel::SecurePassword.min_cost ? BCrypt::Engine::MIN_COST : BCrypt::Engine.cost
    Account.create({branch: "0001", number: "000001", digit: "0",
                    password_digest: BCrypt::Password.create("123456", cost: cost),user_id: 1})
    Account.create({branch: "0001", number: "000002", digit: "0",
                    password_digest: BCrypt::Password.create("654321", cost: cost), user_id: 2 })

    @auth_token_first = JsonWebToken.encode(account_id: 1)
    @auth_token_second = JsonWebToken.encode(account_id: 2)
  end

  test "should raise exception when account is not found" do
    exception = assert_raises ActiveRecord::RecordNotFound do
      TransferOperations.new(10, 2)
    end

    assert_equal("Couldn't find Account with 'id'=10", exception.message)
  end

  test "should not raise RecordNotFound exception" do
    assert_nothing_raised do
      TransferOperations.new(1, 2)
    end
  end
end