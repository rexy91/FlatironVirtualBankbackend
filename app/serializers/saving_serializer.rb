class SavingSerializer < ActiveModel::Serializer
    attributes :acc_num, :balance, :id, :boolean
    has_many :transactions
  end
  