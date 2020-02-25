class EditCheckingColumn < ActiveRecord::Migration[6.0]
  def change
     rename_column :checkings, :statue, :status
  end
end
