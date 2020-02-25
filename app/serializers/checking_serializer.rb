class CheckingSerializer < ActiveModel::Serializer
  attributes :acc_num, :balance, :id
  has_many :transactions
  
end
