class CreateTransactions < ActiveRecord::Migration[6.0]
  def change
    create_table :transactions do |t|
      t.string :trans_type
      t.float :amount
      t.string :description
      t.references :accountable, polymorphic: true
      
      t.timestamps
    end
  end
end
