class TransferOperations

  def initialize(source_account_id, destination_account_id)
    begin
      @source_account = Account.find(source_account_id)
      @destination_account = Account.find(destination_account_id)
    rescue => error
      raise ActiveRecord::RecordNotFound.new(error.message)
    end
  end

  def execute(amount)
    if validate_balance(amount)
      debt_transaction = Transaction.new({transaction_id: Transaction.defineTransactionId,
                                          transaction_type: "DEBIT", account_id: @source_account.id, amount: amount})
      credit_transaction = Transaction.new({transaction_id: Transaction.defineTransactionId,
                                            transaction_type: "CREDIT", account_id: @destination_account.id, amount: amount})

      debt_transaction.save && credit_transaction.save
    else
      raise StandardError.new("Insufficient funds.")
    end
  end

  private
  def validate_balance(amount)
    @source_account.get_balance >= amount
  end
end