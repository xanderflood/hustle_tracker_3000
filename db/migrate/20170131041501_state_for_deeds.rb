class StateForDeeds < ActiveRecord::Migration[5.0]
  def change
    change_table :deeds do |t|
      t.column :state, :integer, default: 3
      t.column :thought_at, :datetime
    end
  end
end
