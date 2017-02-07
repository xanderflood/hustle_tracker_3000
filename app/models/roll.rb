class Roll < ApplicationRecord
  include DeedGlob
  after_validation :check_and_finish
  
  belongs_to :user
  has_many :deeds

  #has_many :rolls?
  def check_and_finish; self.finished = true if total_points == total_value; end
end
