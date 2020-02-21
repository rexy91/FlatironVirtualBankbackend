class SavingSerializer < ActiveModel::Serializer
    attributes :acc_num, :balance
    has_many :transactions
  end
  