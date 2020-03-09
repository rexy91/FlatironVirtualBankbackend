class Saving < ApplicationRecord
  belongs_to :user
  has_many :transactions, as: :accountable , dependent: :destroy

  def saving_signup_deposit(user,checking)
    @user = user
    @saving = checking
    self.balance += 5000
    save!
end

  def withdrawal(amount)
      # byebug
      self.balance -= amount.to_f
      save!
  end

end
