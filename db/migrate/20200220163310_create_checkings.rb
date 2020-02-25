class CreateCheckings < ActiveRecord::Migration[6.0]
  def change
    create_table :checkings do |t|
      t.belongs_to :user, null: true, foreign_key: true
      t.integer :acc_num
      t.float :balance, default: 0 
      t.boolean :statue, default: true 

      t.timestamps
    end
  end
end
