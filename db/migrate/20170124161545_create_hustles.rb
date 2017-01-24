class CreateHustles < ActiveRecord::Migration[5.0]
  def change
    create_table :hustles do |t|
      t.belongs_to :user, foreign_key: true
      t.string :name
      t.datetime :created
      t.datetime :modified

      t.timestamps
    end
  end
end
