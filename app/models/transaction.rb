class Transaction < ApplicationRecord

    belongs_to :accountable, polymorphic: true
end
