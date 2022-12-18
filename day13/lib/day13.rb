
class Day13
  # compare ints, lower should be first
  #
  # compare lists, see above, first should run out of items first
  #
  # if comparing to lonely int, give it some []

  def self.sum_correct_indicies(file)
    cur_index = 1
    input_pairs = {}
    final_sum = 0

    File.open(file).each_slice(3) do |lines|
      input_pairs[cur_index] = [lines[0].strip, lines[1].strip]
      cur_index += 1
    end

    for i in 1 .. input_pairs.keys.max do
      if compare_packets(input_pairs[i][0], input_pairs[i][1])
        final_sum += i
      end
    end
    final_sum
  end

  def self.compare_packets(pac_left, pac_right)
    
  end


  # return sum of indexes of correct pairs
end
