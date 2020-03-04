class TransactionSerializer < ActiveModel::Serializer
  attributes :id, :trans_type, :amount, :date ,:descrpition
  # belongs_to :checking
  # belongs_to :saving
end

