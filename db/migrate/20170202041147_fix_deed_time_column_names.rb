class FixDeedTimeColumnNames < ActiveRecord::Migration[5.0]
  def change
    rename_column :deeds, :started, :started_at
    rename_column :deeds, :finshed, :finshed_at
  end
end
