class UserSerializer < ActiveModel::Serializer
  attributes :id, :username
  has_one :checking
  has_one :saving
  # has_many :transactions, through: :checking
  # has_many :transactions, through: :saving

  def checking
    {
      balance: self.object.checking.balance,
      acc_num: self.object.checking.acc_num,
      transactions: self.object.checking.transactions
    }
  end
  
  def saving
    {
      balance: self.object.saving.balance,
      acc_num: self.object.saving.acc_num,
      transactions: self.object.saving.transactions
    }
  end

end
