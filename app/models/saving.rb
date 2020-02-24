class Saving < ApplicationRecord
  belongs_to :user
  has_many :transactions, as: :accountable , dependent: :destroy

  def saving_signup_deposit(user,checking)
    @user = user
    @saving = checking
    @saving.balance += 5000
    save!
end

end
