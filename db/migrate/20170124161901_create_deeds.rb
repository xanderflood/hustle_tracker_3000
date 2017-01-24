class CreateDeeds < ActiveRecord::Migration[5.0]
  def change
    create_table :deeds do |t|
      t.belongs_to :hustle, foreign_key: true
      t.string :desc
      t.datetime :started
      t.datetime :finished
      t.integer :points

      t.timestamps
    end
  end
end
