class Checking < ApplicationRecord
  belongs_to :user
  has_many :transactions, as: :accountable , dependent: :destroy
  # def transactions
  #   byebug
  # end

  def checking_signup_deposit(user,checking)
      @user = user
      self.balance += 5000
      save!
  end

  def deposit(amount)
      self.balance += amount.to_f
      save!
  end 

  def withdrawal(amount)
      self.balance -= amount.to_f
      save!
  end

#   def instant_transfer(send_acc, receiving_acc, amount)
#     @send_acc = send_acc
#     @receiving_acc = receiving_acc
#     @amount = amount
#   end

end
