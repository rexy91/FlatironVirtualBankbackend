class User < ApplicationRecord
    has_secure_password
    has_one :checking, dependent: :destroy
    has_one :saving, dependent: :destroy
    has_many :transactions, through: :checking
    has_many :transactions, through: :saving

end

