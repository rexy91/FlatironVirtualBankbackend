class CheckingSerializer < ActiveModel::Serializer
  attributes :acc_num, :balance, :id, :status
  has_many :transactions
  
end
