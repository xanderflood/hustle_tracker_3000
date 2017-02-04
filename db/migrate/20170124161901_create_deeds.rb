class CreateDeeds < ActiveRecord::Migration[5.0]
  def change
    create_table :deeds do |t|
      # t.belongs_to :hustle, foreign_key: true
      t.string :desc
      t.datetime :started_at
      t.datetime :finished_at
      t.integer :points

      t.timestamps
    end
  end
end
