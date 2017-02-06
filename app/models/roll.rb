class Roll < ApplicationRecord
  belongs_to :user
  has_many :deeds

  #has_many :rolls?
end
