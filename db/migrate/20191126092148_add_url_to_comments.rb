class AddUrlToComments < ActiveRecord::Migration[6.0]
  def change
    add_column :comments, :url, :string
  end
end
