class Checking < ApplicationRecord
  belongs_to :user
  has_many :transactions, as: :accountable , dependent: :destroy
  # def transactions
  #   byebug
  # end

  def checking_signup_deposit(user,checking)
      @user = user
      @checking = checking
      @checking.balance += 5000
      save!
  end
end
