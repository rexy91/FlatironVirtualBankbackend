class UserSerializer < ActiveModel::Serializer
  attributes :id, :username
  has_one :checking
  has_one :saving
  # has_many :transactions, through: :checking
  # has_many :transactions, through: :saving


  def checking
    # If current user does have a checking account opened.
    if self.object.checking
    {
      balance: self.object.checking.balance,
      acc_num: self.object.checking.acc_num,
      transactions: self.object.checking.transactions
    }
    end
  end
  
  def saving
    # If current user does have a saving account opened.
     if self.object.saving
        {
          balance: self.object.saving.balance,
          acc_num: self.object.saving.acc_num,
          transactions: self.object.saving.transactions
        }
    end
  end

end
