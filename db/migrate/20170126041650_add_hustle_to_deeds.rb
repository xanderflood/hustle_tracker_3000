class AddHustleToDeeds < ActiveRecord::Migration[5.0]
  def change
    add_reference :deeds, :hustle, foreign_key: true
  end
end
