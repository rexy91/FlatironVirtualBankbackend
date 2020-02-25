class CreateSavings < ActiveRecord::Migration[6.0]
  def change
    create_table :savings do |t|
      t.belongs_to :user, null: true, foreign_key: true
      t.float :balance, default: 0
      t.integer :acc_num
      t.boolean :status, default: true 

      t.timestamps
    end
  end
end
