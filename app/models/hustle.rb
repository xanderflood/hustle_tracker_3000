class Hustle < ApplicationRecord
  belongs_to :user
  has_many :deeds

  def active; deeds.active; end
  def thought; deeds.thought; end
  def done; deeds.done; end

  def total_points
    if deeds.empty?
      0
    else
      self.deeds.map{ |deed| deed.points }.inject(:+)
    end
  end
end
