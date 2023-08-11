# frozen_string_literal: false

# mostly taken from solution:
class Clock
  attr_reader :hour, :minute

  ONE_DAY = 24 * 60

  def initialize(hour, minute)
    @hour = hour
    @minute = minute
  end

  def self.at(hour, minute = 0)
    Clock.new(hour, minute)
  end

  def +(other)
    minutes_since_midnight = compute_minutes_since_midnight + other
    minutes_since_midnight -= ONE_DAY while minutes_since_midnight >= ONE_DAY

    compute_time_from(minutes_since_midnight)
  end

  def -(other)
    minutes_since_midnight = compute_minutes_since_midnight - other
    minutes_since_midnight += ONE_DAY while minutes_since_midnight.negative?

    compute_time_from(minutes_since_midnight)
  end

  def ==(other)
    hour == other.hour &&
      minute == other.minute
  end

  def to_s
    display_hour = hour.to_s
    display_minute = minute.to_s
    display_hour.size == 1 ? display_hour = "0#{display_hour}" : display_hour
    display_minute.size == 1 ? display_minute = "0#{display_minute}" : display_minute
    "#{display_hour}:#{display_minute}"
  end

  def compute_minutes_since_midnight
    total_minutes = 60 * hour + minute
    total_minutes % ONE_DAY
  end

  def compute_time_from(minutes_since_midnight)
    hours, minutes = minutes_since_midnight.divmod(60)
    hours %= 24
    self.class.new(hours, minutes)
  end
end
