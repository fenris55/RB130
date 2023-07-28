class PerfectNumber

  def self.classify(number)
    raise StandardError unless number > 0
    aliquot_sum = find_aliquot(number)
    return 'perfect' if number == aliquot_sum
    return 'deficient' if number > aliquot_sum
    return 'abundant' if number < aliquot_sum
  end

  def self.find_aliquot(number)
    midpoint = number / 2
    divisors = (1..midpoint).select do |current_num|
      number % current_num == 0
    end

    divisors.sum
  end
end

