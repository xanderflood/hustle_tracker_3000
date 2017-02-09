class Hustle < ApplicationRecord
  include DeedGlob

  belongs_to :user
  has_many :deeds

  validates_uniqueness_of :name
  validates_uniqueness_of :name, message: "this name is already taken - please choose another"
end
