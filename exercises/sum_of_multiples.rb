class SumOfMultiples
  attr_reader :number_list

  def initialize(*list)
    list = [3, 5] if list.empty?
    @number_list = list
  end

  def to(target_number)
    result = 0
    (1...target_number).each do |current_num|
      if number_list.any? { |list_num| current_num % list_num == 0 }
        result +=current_num
      end
    end
    result
  end

  def self.to(target_num)
    SumOfMultiples.new.to(target_num)
  end
end