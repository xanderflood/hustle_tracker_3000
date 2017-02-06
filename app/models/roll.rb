class Roll < ApplicationRecord
  belongs_to :user
  has_many :deeds

  #has_many :rolls?
  def finish; self.finished = true; end
end
