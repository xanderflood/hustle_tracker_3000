class Hustle < ApplicationRecord
  include DeedGlob

  belongs_to :user
  has_many :deeds
end
