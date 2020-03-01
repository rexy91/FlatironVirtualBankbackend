class AddBillingAddressToSuer < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :billing_address, :string
  end
end
