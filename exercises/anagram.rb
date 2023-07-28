class Anagram
  attr_reader :word
  
  def initialize(word)
    @word = word
  end

  def match(array)
    sorted_word_letters = word.downcase.chars.sort

    array.select do |test_word|
      test_word.downcase.chars.sort == sorted_word_letters &&
      test_word.downcase != word.downcase
    end
  end
end
