#1.9
# require "minitest/autorun"
# require_relative "text"

# class TextTest < Minitest::Test

#   def setup
#     @file = File.open("text_sample_text.txt", 'r')
#   end

#   # 1.9
#   def test_swap
#     text = Text.new(@file.read)
#     swapped_text = text.swap('a', 'e')

#     expected_output = <<~EXPECTED_OUTPUT.chomp
#     Lorem ipsum dolor sit emet, consectetur edipiscing elit. Cres sed vulputete ipsum.
#     Suspendisse commodo sem ercu. Donec e nisi elit. Nullem eget nisi commodo, volutpet
#     quem e, viverre meuris. Nunc viverre sed messe e condimentum. Suspendisse ornere justo
#     nulle, sit emet mollis eros sollicitudin et. Etiem meximus molestie eros, sit emet dictum
#     dolor ornere bibendum. Morbi ut messe nec lorem tincidunt elementum vitee id megne. Cres
#     et verius meuris, et pheretre mi.
#     EXPECTED_OUTPUT

#     assert_equal(expected_output, swapped_text)
#   end

#   def teardown
#     @file.close
#   end
# end

#1.10
require "minitest/autorun"
require_relative "text"

class TextTest < Minitest::Test
  def setup
    @file = File.open("text_sample_text.txt", "r")
  end 

 # adding back in 1.9 to ensure both tests work
  def test_swap
   text = Text.new(@file.read)
   swapped_text = text.swap('a', 'e')

   expected_output = <<~EXPECTED_OUTPUT.chomp
   Lorem ipsum dolor sit emet, consectetur edipiscing elit. Cres sed vulputete ipsum.
   Suspendisse commodo sem ercu. Donec e nisi elit. Nullem eget nisi commodo, volutpet
   quem e, viverre meuris. Nunc viverre sed messe e condimentum. Suspendisse ornere justo
   nulle, sit emet mollis eros sollicitudin et. Etiem meximus molestie eros, sit emet dictum
   dolor ornere bibendum. Morbi ut messe nec lorem tincidunt elementum vitee id megne. Cres
   et verius meuris, et pheretre mi.
   EXPECTED_OUTPUT

   assert_equal(expected_output, swapped_text)
 end

  # shortcut version - used irb to find expected count - works
  # def test_word_count
  #   text = Text.new(@file.read)
  #   assert_equal(72, text.word_count) # solution uses this approach
  # end 

  #keeping all testing in the program, using a heredoc to get word count: works
  def test_word_count
    actual_text = Text.new(@file.read)
    sample_text = <<~SAMPLE_TEXT
    Lorem ipsum dolor sit amet, consectetur adipiscing elit. Cras sed vulputate ipsum.
    Suspendisse commodo sem arcu. Donec a nisi elit. Nullam eget nisi commodo, volutpat
    quam a, viverra mauris. Nunc viverra sed massa a condimentum. Suspendisse ornare justo
    nulla, sit amet mollis eros sollicitudin et. Etiam maximus molestie eros, sit amet dictum
    dolor ornare bibendum. Morbi ut massa nec lorem tincidunt elementum vitae id magna. Cras
    et varius mauris, at pharetra mi.
    SAMPLE_TEXT

    expected_count = sample_text.split.count
    assert_equal(expected_count, actual_text.word_count)
  end

  def teardown
    @file.close
    puts "File has been closed: #{@file.closed?}" #suggested by solution to confirm file close after each test
  end
end