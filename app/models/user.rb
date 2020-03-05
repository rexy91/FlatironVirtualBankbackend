class User < ApplicationRecord
    has_secure_password
    has_one :checking, dependent: :destroy
    has_one :saving, dependent: :destroy
    has_many :transactions, through: :checking
    has_many :transactions, through: :saving

    # Validations:
    validates :username, presence: true, length: { minimum: 5, maximum: 10}
    validates :password, presence: true, length: { minimum: 7, maximum: 20}
end

