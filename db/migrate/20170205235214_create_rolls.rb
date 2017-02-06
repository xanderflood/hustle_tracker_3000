class CreateRolls < ActiveRecord::Migration[5.0]
  def change
    create_table :rolls do |t|
      t.timestamps
      t.belongs_to :user, foreign_key: true
      
      t.string :name, unique: true
      t.datetime :deadline
      t.boolean :finished, default: false
    end

    add_reference :deeds, :roll, foreign_key: true
  end
end
