class BeerSong
  def self.verse(number)
    if number == 0
      "No more bottles of beer on the wall, no more bottles of beer.\n" \
      "Go to the store and buy some more, 99 bottles of beer on the wall.\n"
    else
      "#{number} bottle#{number == 1 ? '' : "s"} of beer on the wall, " \
      "#{number} bottle#{number == 1 ? '' : "s"} of beer.\n" \
       "Take #{number == 1 ? 'it' : 'one'} down and pass it around, " \
      "#{number.pred == 0 ? "no more" : number.pred} " \
      "bottle#{number.pred == 1 ? '' : "s"} of beer on the wall.\n"
     end
  end

  def self.verses(start_number, end_number)
    counter = start_number
    result = ""
      loop do
        result << "#{self.verse(counter)}" #maybe could also interpolate this and then add double newline, push to string instead
        counter -= 1
        break if counter < end_number
        result <<  "\n" \
      end
      result #since there's no output, storing all generating strings
  end

  def self.lyrics
    self.verses(99, 00)
  end
end


# refactoring attempt (not cuurently working:
# tried getting this down to just one copy of the text- needs a little more work 
# class BeerSong
#   def self.verse(number)
#     number == 0 ? number = 'no more' : number
#     result = ''
    
#     result << "#{number} bottle#{number != 1 ? 's' : ''} of beer on the wall, " #\
#     result << "#{number} bottle#{number != 1 ? 's' : ''} of beer.\n" #\
#       if number == 'No more'
#         result << "Go to the store and buy some more, 99 bottles of beer on the wall.\n"
#       else
#         result << "Take #{number == 1 ? 'it' : 'one'} down and pass it around, " #\
#         result << "#{number == 1 ? "no more" : number.pred} " #\
#         result << "bottle#{number == 2 ? '' : "s"} of beer on the wall.\n"
#       end
#       result
#   end

#   def self.verses(start_number, end_number)
#     counter = start_number
#     result = ""
#       loop do
#         result << "#{self.verse(counter)}" #maybe could also interpolate this and then add double newline, push to string instead
#         counter -= 1
#         break if counter < end_number
#         result <<  "\n" \
#       end
#       result #since there's no output, storing all generating strings
#   end

#   def self.lyrics
#     self.verses(99, 00)
#   end
# end

# puts BeerSong.verses(3, 0)