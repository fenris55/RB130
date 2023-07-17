# 1.1

# class Device
#   def initialize
#     @recordings = []
#   end

#   def record(recording)
#     @recordings << recording
#   end

#   def listen
#     record(yield) if block_given?
#   end

#   def play
#     puts @recordings.last
#   end
# end


# listener = Device.new
# listener.listen { "Hello World!" }
# listener.listen
# listener.play # Outputs "Hello World!"

# 1.2

# class TextAnalyzer
#   #this is an example of sandwhich code: between opening and closing the file, something happens
#   def process
#     file = File.open("medium1_sample_text.txt")
#     file_text = file.read
#     yield(file_text) # solution called #read while passing to yield
#     file.close # added from solution
#   end
# end

# analyzer = TextAnalyzer.new
# analyzer.process { |text| puts "#{text.split("\n\n").count} lines" }
# analyzer.process { |text| puts "#{text.split("\n").count} lines" }
# analyzer.process { |text| puts "#{text.split.count} words" }

#sample output: 
# 3 paragraphs
# 15 lines
# 126 words

# 1.3

# items = ['apples', 'corn', 'cabbage', 'wheat']

# def gather(items)
#   puts "Let's start gathering food."
#   yield(items) if block_given? #puts "#{items.join(', ')}"
#   puts "Nice selection of food we have gathered!"
# end

# notes: lesson solution uses parameters for all, but seems to not be necessary/
# the first exmaple below allow the arg to be renames and allows for single line output
# gather(items) {|item| puts item }
# gather(items) { |item| puts items.join(", ") } # don't see a difference with or without parameter
# gather(items) { puts items.join(", ").capitalize }
# gather(items) { puts items.join(", ").capitalize + '.' }
# gather(items) { puts "We have some #{items[0]} and #{items[1]}." }

# 1.4

# Notes: both solutions return the requested array. Instructions aren't clear about the scope of the raptors
# variable. Opted to initilaize it first and then use the block to populate it, so that the modified array can 
# be accessed in the main scope

# def bird_sorter(array)
#   yield(array)
# end

# raptors = []
# p bird_sorter(['robin', 'cardinal', 'hawk', 'eagle', 'falcon']) { |bird1, bird2, *other_birds| raptors = other_birds}
# p raptors

#solution 2:

# def bird_sorter(array)
#   raptors = yield(array)
# end

# p bird_sorter(['robin', 'cardinal', 'hawk', 'eagle', 'falcon']) { |bird1, bird2, *other_birds| other_birds}

# 1.5
# items = ['apples', 'corn', 'cabbage', 'wheat']

# def gather(items)
#   puts "Let's start gathering food."
#   yield(items)
#   puts "We've finished gathering!"
# end


# # 5.4
# gather(items) do |food1, food2, food3, food4|
#   puts "#{food1}, #{food2}, #{food3}, and #{food4}"
# end

# expected output: 
# Let's start gathering food.
# apples, corn, cabbage, and wheat
# We've finished gathering!

# 5.3: 
# gather(items) do |first_food, *other_foods|
#   puts first_food
#   puts "#{other_foods.join(', ')}"
# end

# Expected output: 
# Let's start gathering food.
# apples
# corn, cabbage, wheat
# We've finished gathering!

# 5.2:
# gather(items) do |first_food, *middle_foods, last_food|
#   puts first_food
#   puts "#{middle_foods.join(", ")}"
#   puts last_food
# end

# expected output: 
# Let's start gathering food.
# apples
# corn, cabbage
# wheat
# We've finished gathering!

# 5.1:
# gather(items) do |*first_foods, last_food|
#   puts "#{first_foods.join(', ')}"
#   puts last_food
# end

#expected output: 
# Let's start gathering food.
# apples, corn, cabbage
# wheat
# We've finished gathering!

# 1.6

# Replace the two `method_name` placeholders with actual method calls
# def convert_to_base_8(n)
#   n.to_s(8).to_i
# end

# Replace `argument` with the correct argument below
# `method` is `Object#method`, not a placeholder

#note: method is converted to a symbol and then passed to Object#method, 
#which converts it to an object. that object is then converted to a proc.
# base8_proc = method(:convert_to_base_8).to_proc


# We'll need a Proc object to make this code work
# Replace `a_proc` with the correct object
# p [8, 10, 12, 14, 16, 33].map(&base8_proc)

# functionally, this is happening: 
# [8, 10, 12, 14, 16, 33].map { |n| n.to_s(8).to_i }

#expected return: 
# [10, 12, 14, 16, 20, 41]


# 1.7
# def bubble_sort!(array)
#   loop do
#     swapped = false
#     1.upto(array.size - 1) do |index|
#       if block_given?
#         next if yield(array[index - 1], array[index])
#          array[index - 1], array[index] = array[index], array[index - 1]
#         swapped = true
#     else
#        next if array[index - 1] <= array[index]
#        array[index - 1], array[index] = array[index], array[index - 1]
#      end
#        swapped = true
#     end

#     break unless swapped
#   end
# end

# lesson solution splits the same logic differently to avoid repetition: 
# def bubble_sort!(array)
#   loop do
#     swapped = false
#     1.upto(array.size - 1) do |index|
#       if block_given?
#         next if yield(array[index - 1], array[index])
#       else
#         next if array[index - 1] <= array[index]
#       end

#       #now these lines only appear once: 
#       array[index - 1], array[index] = array[index], array[index - 1]
#       swapped = true
#     end
#     break unless swapped
#   end
# end

# array = [5, 3]
# bubble_sort!(array)
# p array == [3, 5]

# array = [5, 3, 7]
# bubble_sort!(array) { |first, second| first >= second }
# p array == [7, 5, 3]

# array = [6, 2, 7, 1, 4]
# bubble_sort!(array)
# p array == [1, 2, 4, 6, 7]

# array = [6, 12, 27, 22, 14]
# bubble_sort!(array) { |first, second| (first % 7) <= (second % 7) }
# p array == [14, 22, 12, 6, 27]

# array = %w(sue Pete alice Tyler rachel Kim bonnie)
# bubble_sort!(array)
# p array == %w(Kim Pete Tyler alice bonnie rachel sue)

# array = %w(sue Pete alice Tyler rachel Kim bonnie)
# bubble_sort!(array) { |first, second| first.downcase <= second.downcase }
# p array == %w(alice bonnie Kim Pete rachel sue Tyler)

# further exploration: 

def bubble_sort!(array)
  loop do
    swapped = false
    1.upto(array.size - 1) do |index|
      next if yield(array[index - 1]) <= yield(array[index])
      array[index - 1], array[index] = array[index], array[index - 1]
      swapped = true
     end
     break unless swapped
   end
 end

array = %w(sue Pete alice Tyler rachel Kim bonnie)
bubble_sort!(array) { |value| value.downcase }
p array == %w(alice bonnie Kim Pete rachel sue Tyler)
