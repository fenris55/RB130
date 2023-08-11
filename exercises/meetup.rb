# frozen_string_literal: false

require 'date'
# Medium 1.4, relied heavily on hints for meetup
class Meetup
  MONTHS_WITH_THIRTY_DAYS = [4, 6, 9, 11].freeze

  attr_reader :year, :month, :last_day_of_month

  def initialize(year, month)
    @year = year
    @month = month
    @last_day_of_month = Date.civil(year, month, -1)
  end

  def day(weekday, schedule)
    week = find_week(schedule).to_a

    week.each do |date|
      return nil if invalid_date(date)

      day = Date.civil(year, month, date)
      return day if find_weekday(weekday, day)
    end

    nil
  end

  # restructed from || to case statement to as in solution but still a problem for rubocop
  def find_weekday(weekday, day) # rubocop:disable Metrics/CyclomaticComplexity
    case weekday.capitalize
    when 'Sunday'    then day.sunday?
    when 'Monday'    then day.monday?
    when 'Tuesday'   then day.tuesday?
    when 'Wednesday' then day.wednesday?
    when 'Thursday'  then day.thursday?
    when 'Friday'    then day.friday?
    when 'Saturday'  then day.saturday?
    end
  end

  def find_week(schedule)
    case schedule.downcase
    when 'first'  then (1..7)
    when 'second' then (8..14)
    when 'third'  then (15..21)
    when 'fourth' then (22..28)
    when 'fifth'  then (29..31)
    when 'last'   then (last_day_of_month.day - 6..last_day_of_month.day)
    else               (13..19)
    end
  end

  def invalid_date(date)
    return true if date > 30 && MONTHS_WITH_THIRTY_DAYS.include?(month)
    return true if date > 29 && month == 2

    false
  end
end
