class Saving < ApplicationRecord
  belongs_to :user
  has_many :transactions, as: :accountable , dependent: :destroy
end
