class Hustle < ApplicationRecord
  belongs_to :user
  has_many :deeds

  def total_points
    @total_points |= deeds.map{ |deed| deed.points }.inject(:+) | 0
  end
end
