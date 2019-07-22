class Transaction < ApplicationRecord
  validates :amount, numericality: { greater_than: 0}


  def self.defineTransactionId
    last_trs = Transaction.order("id").last
    last_trs.blank? ? 1 : last_trs.transaction_id.to_i + 1
  end
end
