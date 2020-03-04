class AddSignupCodeToUser < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :signup_code, :integer
  end
end
