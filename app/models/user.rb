class User < ApplicationRecord
  has_many :source_accounts, :class_name => 'Transaction', :foreign_key => 'source_id'
  has_many :destination_accounts, :class_name => 'Transaction', :foreign_key => 'destination_id'

  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i

  before_save :normalizeEmail

  validates :name, length: {minimum: 1, maximum: 100}
  validates :email, presence: true, format: { with: VALID_EMAIL_REGEX }, uniqueness: { case_sensitive: false }
  validates :tax_document, length: {minimum: 11, maximum: 14}

  def normalizeEmail
    self.email.downcase
  end
end
