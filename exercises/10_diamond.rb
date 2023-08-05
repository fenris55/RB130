# Challenge exercise medium 1

# class Diamond
#   LETTERS = ('A'..'Z').to_a

#   def self.inner_spaces(num)
#     if num == 1
#       num
#     else
#       num + num.pred
#     end
#   end

#   def self.make_diamond(letter)
#     return "A\n" if letter == LETTERS.first

#     total_spaces = LETTERS.index(letter)

#     result = ''
#     result << "#{' ' * total_spaces}A#{' ' * total_spaces}\n"

#   1.upto(LETTERS.index(letter)) do |idx|
#     buffer = LETTERS.index(letter) - idx
#     result << "#{' ' * buffer}#{LETTERS[idx]}#{' ' * inner_spaces(idx)}#{LETTERS[idx]}#{' ' * buffer}\n"
#   end

#   (LETTERS.index(letter) - 1).downto(1) do |idx|
#     buffer = LETTERS.index(letter) - idx
#     result << "#{' ' * buffer}#{LETTERS[idx]}#{' ' * inner_spaces(idx)}#{LETTERS[idx]}#{' ' * buffer}\n"
#   end

#   result << "#{' ' * total_spaces}A#{' ' * total_spaces}\n"
#   result
#   end
# end

# NOTE: the below line and placement were required to clear the final rubocop offense

# frozen_string_literal: false

# refactoring for rubocop (2 helper methods)
class Diamond
  LETTERS = ('A'..'Z').to_a

  def self.make_diamond(letter)
    return single_letter_line(letter) if letter == LETTERS.first

    result = ''
    result << single_letter_line(letter)
    result << top_half(letter)
    result << bottom_half(letter)
    result << single_letter_line(letter)
    result
  end

  class << self
    private

    def single_letter_line(letter)
      total_spaces = LETTERS.index(letter)
      "#{' ' * total_spaces}A#{' ' * total_spaces}\n"
    end

    def inner_spaces(num)
      num == 1 ? num : num + num.pred
    end

    def top_half(letter)
      result = ''
      1.upto(LETTERS.index(letter)) do |idx|
        buffer = LETTERS.index(letter) - idx
        result << "#{' ' * buffer}#{LETTERS[idx]}#{' ' * inner_spaces(idx)}#{LETTERS[idx]}#{' ' * buffer}\n"
      end
      result
    end

    def bottom_half(letter)
      result = ''
      (LETTERS.index(letter) - 1).downto(1) do |idx|
        buffer = LETTERS.index(letter) - idx
        result << "#{' ' * buffer}#{LETTERS[idx]}#{' ' * inner_spaces(idx)}#{LETTERS[idx]}#{' ' * buffer}\n"
      end
      result
    end
  end
end
