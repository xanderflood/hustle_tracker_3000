class Hustle < ApplicationRecord
  belongs_to :user
  has_many :deeds

  def total_points
    if deeds.empty?
      0
    else
      self.deeds.map{ |deed| deed.points }.inject(:+)
    end
  end
end
