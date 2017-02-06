class Deed < ApplicationRecord
  class StateError < StandardError; end

  before_validation(on: :create) do
    self.thought_at ||= Time.now
    self.started_at ||= Time.now if started?
    self.finished_at ||= Time.now if done?
  end

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

  def self.initial_time_params state, time=Time.now
    ret = {
      thought_at: time
    }
    ret.merge!({ started_at: time }) if state != 'thought'
    ret.merge!({ finished_at: time }) if state == 'finished'
    ret
  end

  def started?; state != 'thought'; end
  def done?; state == 'done'; end

  def start
    return unless self.state == 'thought'

    self.state = 'active'
    self.eph_started_at = Time.now
    self.started_at = self.eph_started_at if self.total_elapsed == 0
  end

  def pause
    return if self.state != 'active'

    self.total_elapsed += (Time.now - self.eph_started_at)
    self.state = 'thought'
  end

  def do
    return if self.state == 'done'

    start unless started?

    self.state = 'done'
    self.finished_at = Time.now
  end

  def when what=self.state
    if what == 'thought'
      self.thought_at
    elsif what == 'active'
      self.started_at
    elsif what == 'done'
      self.finished_at
    else
      raise StandardError
    end
  end

  def to_h
    {
      state: state
    }
  end
end
