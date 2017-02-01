class Deed < ApplicationRecord
  class StateError < StandardError; end

  after_initialize :init

  belongs_to :hustle
  enum state: [:thought, :active, :done]

  validates :desc, presence: { message: "what did you do?" }
  validates :points, presence: { message: "how long did it take?" }
  validates :state, presence: { message: "is it done?" }

  validates :thought_at, presence: { message: "missing thought time" }
  validates :started_at, presence: { message: "missing start time" }, if: :started?
  validates :finished_at, presence: { message: "missing start time" }, if: :done?

  # the initializer only needs state and a date, and `init` will assign the various dates appropriately
  # can i do something like this for update? esp. state update?
  #
  #
  # => 
  # => 
  # => IDEA: by passing along an attribute called "time" and one or more of "think" "start" and "finish"
  # =>      I can trigger calls to start= and finish=. is there a way to just call start and finish?
  # => 
  # => 
  #

  def init

  end

  def started?; [:thought, :active].include? state; end
  def done?; state == :done; end

  def start

  end

  def finish
  end
end
