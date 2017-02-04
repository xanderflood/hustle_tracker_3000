class FixDeedTimeColumnNames < ActiveRecord::Migration[5.0]
  def change
    rename_column :deeds, :started, :started_at
    rename_column :deeds, :finished, :finished_at
  end
end
