class DNA
  def initialize(sequence)
    @sequence = sequence
  end

  def hamming_distance(new_sequence)
    test_sequence = [@sequence, new_sequence].min_by { |s| s.size}

    count = 0
    
    (0...test_sequence.size).each do |index|
      count += 1 if @sequence[index] != new_sequence[index]
    end

    count
  end
end
