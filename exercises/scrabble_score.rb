# first solution: works
# class Scrabble
#   LETTER_SCORES = { 
#     ['A', 'E', 'I', 'O', 'U', 'L', 'N', 'R', 'S', 'T'] => 1,
#     ['D', 'G'] => 2,
#     ['B', 'C', 'M', 'P'] => 3,
#     ['F', 'H', 'V', 'W', 'Y'] => 4,
#     ['K'] => 5,
#     ['J', 'X'] => 8,
#     ['Q', 'Z'] => 10
#   }
# #attr_reader :word

#   def initialize(word)
#     @word = word
#   end

# # change this to word instead of @word and then create a local/class variable also called word to reference;
# # refoactoring below be this is a working solution
#   def score
#     return 0 if @word.nil?
#     letters = @word.upcase.chars
#     numbers = letters.map do |letter|
#                 score = 0
#                 LETTER_SCORES.each do |array, number|
#                   score = LETTER_SCORES[array] if array.include?(letter) 
#                 end
#                 score
#               end
#               return 0 if numbers.empty?
#   numbers.reduce(&:+)
#   end

# # did not check tests carefully -> needed CLASS method
# # refactor and think if instance logic can be invoked here
#   def self.score(word)
#     return 0 if word.nil?
#     letters = word.upcase.chars
#     numbers = letters.map do |letter|
#                 score = 0
#                 LETTER_SCORES.each do |array, number|
#                   score = LETTER_SCORES[array] if array.include?(letter) 
#                 end
#                 score
#               end
#               return 0 if numbers.empty?
#   numbers.reduce(&:+)
#   end
# end
########################################################################################################################
# second solution: class method relies on instance method
# class Scrabble
#   LETTER_SCORES = { 
#     ['A', 'E', 'I', 'O', 'U', 'L', 'N', 'R', 'S', 'T'] => 1,
#     ['D', 'G'] => 2,
#     ['B', 'C', 'M', 'P'] => 3,
#     ['F', 'H', 'V', 'W', 'Y'] => 4,
#     ['K'] => 5,
#     ['J', 'X'] => 8,
#     ['Q', 'Z'] => 10
#   }

#   attr_reader :word

#   def initialize(word)
#     @word = word
#   end

#   def score
#     return 0 if word.nil?
#     letters = word.upcase.chars
#     numbers = letters.map do |letter|
#                 score = 0
#                 LETTER_SCORES.each do |array, number|
#                   score = LETTER_SCORES[array] if array.include?(letter) 
#                 end
#                 score
#               end
#               return 0 if numbers.empty?
#   numbers.reduce(&:+)
#   end

#   # couldn't figure out before how to get the class method to make use of the instance method
#   # remembered can create an object within the class method
#   def self.score(word)
#     word = Scrabble.new(word)
#     word.score
#   end
# end

# puts Scrabble.score('a')

#thoughts: 
# second solution is obviously better and less redundant
# still not love the logic in the main method
# could easily shorted by setting the reference has to the entire alphabet;
# that would eliminate the need for the nested iteration, but the scoring system would be 
# less clear

#what about iteraing over the collection and using #gsub to replace all elements in the string?
# follow up: didn't work because 10 became 1 and 0 when converting to digits, etc -> wrong addition result
########################################################################################################################
# third solution - feel best about this one. 
# class Scrabble
#   LETTER_SCORES = { 
#     ['A', 'E', 'I', 'O', 'U', 'L', 'N', 'R', 'S', 'T'] => 1,
#     ['D', 'G'] => 2,
#     ['B', 'C', 'M', 'P'] => 3,
#     ['F', 'H', 'V', 'W', 'Y'] => 4,
#     ['K'] => 5,
#     ['J', 'X'] => 8,
#     ['Q', 'Z'] => 10
#   }

#   attr_reader :word

#   def initialize(word)
#     @word = word
#   end

#   def score
#     return 0 if word.nil?
#     scored_word = word.upcase
#     scores = []
#     LETTER_SCORES.each do |array, score|
#       array.each do |letter|
#       #  scored_word.count(letter) == 0 ? next : scores << score * scored_word.count(letter) #more logic
#          scores << score * scored_word.count(letter) # shorter but pushes unnecessary 0s
#       end
#     end
#     scores.empty? ? 0 : scores.reduce(&:+)
#   end

#   def self.score(word)
#     class_word = Scrabble.new(word)
#     class_word.score
#   end
# end

# test_word = Scrabble.new('aaa')
# puts test_word.score
# puts Scrabble.score('aaa')
#####################################################################################################################
#note: lesson solution just increments a score 
# solution 4: 

class Scrabble
  LETTER_SCORES = { 
    ['A', 'E', 'I', 'O', 'U', 'L', 'N', 'R', 'S', 'T'] => 1,
    ['D', 'G'] => 2,
    ['B', 'C', 'M', 'P'] => 3,
    ['F', 'H', 'V', 'W', 'Y'] => 4,
    ['K'] => 5,
    ['J', 'X'] => 8,
    ['Q', 'Z'] => 10
  }

  attr_reader :word

  def initialize(word)
    @word = word
  end

  def score
    return 0 if word.nil?
    scored_word = word.upcase
    score = 0

    LETTER_SCORES.each do |array, number|
      array.each do |letter|
        count = scored_word.count(letter)
        score += (count * number) if scored_word.include?(letter)
      end
    end
    score
  end

  def self.score(word)
    class_word = Scrabble.new(word)
    class_word.score
  end
end

#thoughts: not really any shorter, but easier to read than previous solution
# follow up: solution takes my original approach of the nested iteration: 
# over the word and then within that over the hash