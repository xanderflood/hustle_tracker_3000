class AddElapsedToDeed < ActiveRecord::Migration[5.0]
  def change
    change_table :deeds do |t|
      t.column :total_elapsed, :float, default: 0
      t.column :eph_started_at, :datetime
    end
  end
end
