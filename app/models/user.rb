class User < ApplicationRecord
  has_many :source_accounts, :class_name => 'Transaction', :foreign_key => 'source_id'
  has_many :destination_accounts, :class_name => 'Transaction', :foreign_key => 'destination_id'
end
