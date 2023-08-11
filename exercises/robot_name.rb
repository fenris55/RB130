# below line required to appease rubocop

# frozen_string_literal: false

# Medium challenge 1.2
class Robot
  @@all_names = []

  attr_reader :name

  def initialize
    @name = assign_name
  end

  def assign_name
    new_name = []
    loop do
      2.times { new_name << ('A'..'Z').to_a.sample }
      3.times { new_name << (0..9).to_a.sample }
      break unless @@all_names.include?(new_name.join)

      new_name = []
    end
    @@all_names << new_name.join
    new_name.join
  end

  def reset
    @name = assign_name
  end
end
