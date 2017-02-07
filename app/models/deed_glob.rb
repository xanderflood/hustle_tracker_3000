module DeedGlob
  def active; deeds.active; end
  def idea; deeds.idea; end
  def done; deeds.done; end

  def total_points
    if deeds.empty?
      0
    else
      self.deeds.map{ |deed| deed.points }.inject(:+)
    end
  end

  def total_value
    if deeds.empty?
      0
    else
      self.deeds.map{ |deed| deed.points }.inject(:+)
    end
  end
end