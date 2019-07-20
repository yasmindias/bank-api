class Transaction < ApplicationRecord
  belongs_to :source, :class_name => 'User'
  belongs_to :destination, :class_name => 'User'

  validates :amount, numericality: { greater_than: 0}
end
