class CreateEvents < ActiveRecord::Migration[6.0]
  def change
    create_table :events do |t|
      t.datetime :date
      t.references :preferences, null: false, foreign_key: true
      t.string :type
      t.string :name

      t.timestamps
    end
  end
end
