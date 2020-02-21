class Checking < ApplicationRecord
  belongs_to :user
  has_many :transactions, as: :accountable , dependent: :destroy
  # def transactions
  #   byebug
  # end
end
