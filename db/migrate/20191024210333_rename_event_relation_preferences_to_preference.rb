class RenameEventRelationPreferencesToPreference < ActiveRecord::Migration[6.0]
  def change
    rename_column :events, :preferences_id, :preference_id
  end
end
