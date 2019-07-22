class Account < ApplicationRecord
  has_secure_password
  belongs_to :user
  has_many :transactions

  def to_json(options={})
    options[:except] ||= [:password_digest]
    super(options)
  end

  def get_balance
    positive_balance = Transaction.where("account_id = ? AND (transaction_type = ? OR transaction_type = ?)",
                                         self.id, "DEPOSIT", "CREDIT").sum(:amount)
    negative_balance = Transaction.where("account_id = ? AND transaction_type = ?", self.id, "DEBIT").sum(:amount)
    positive_balance - negative_balance
  end
end
