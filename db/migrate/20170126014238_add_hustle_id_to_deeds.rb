class AddHustleIdToDeeds < ActiveRecord::Migration[5.0]
  def change
    add_column :deeds, :hustle_id, :integer
    add_index :deeds, :hustle_id
  end
end
