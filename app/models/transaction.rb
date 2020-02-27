class Transaction < ApplicationRecord

    belongs_to :accountable, polymorphic: true
    # To call on association:
    # @transaction.accountable
end
