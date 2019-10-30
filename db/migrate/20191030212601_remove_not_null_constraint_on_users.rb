class RemoveNotNullConstraintOnUsers < ActiveRecord::Migration[6.0]
  def change
    change_column :users, :first_name, :string, :null => true
  end
end
