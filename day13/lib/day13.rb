
class Day13
  def self.sum_correct_indicies(file)
    cur_index = 1
    input_pairs = {}
    final_sum = 0

    File.open(file).each_slice(3) do |lines|
      input_pairs[cur_index] = [eval(lines[0].strip), eval(lines[1].strip)]
      cur_index += 1
    end

    for i in 1 .. input_pairs.keys.max do
      if is_order_correct(input_pairs[i][0], input_pairs[i][1])
        final_sum += i
      end
    end
    final_sum
  end

  def self.is_order_correct(pac_left, pac_right)
    result = nil
    for i in 0 .. [pac_left.size, pac_right.size].min - 1 do
      if pac_left[i].kind_of?(Array) && pac_right[i].kind_of?(Array)
        # if both lists, check values in lists
        result = is_order_correct(pac_left[i], pac_right[i])
        if !result.nil?
          return result
        end
      elsif pac_left[i].kind_of?(Array)
        result = is_order_correct(pac_left[i], [pac_right[i]])
        if !result.nil?
          return result
        end
      elsif pac_right[i].kind_of?(Array)
        result = is_order_correct([pac_left[i]], pac_right[i])
        if !result.nil?
          return result
        end
      elsif pac_left[i].kind_of?(Integer) && pac_right[i].kind_of?(Integer)
        # if both ints
        if pac_left[i] == pac_right[i]
          # same int, check next value
          next
        elsif pac_left[i] < pac_right[i]
          # left int < right int, order is correct
          return true
        elsif pac_left[i] > pac_right[i]
          # left int > right int, order is wrong
          return false
        end
      end
    end
    if pac_left.size < pac_right.size
      result = true
    elsif pac_left.size > pac_right.size
      result = false
    end
    result
  end

  def self.order_packets(file)
    input = []

    File.foreach(file, chomp:true) do |line|
      if line.length > 0
        input << eval(line)
      end
    end

    input << eval('[[2]]')
    input << eval('[[6]]')

    all_correct = false
    until all_correct do
      all_correct = true
      for i in 0 .. input.size - 2 do
        input_left = input[i]
        input_right = input[i + 1]
        if !is_order_correct(input_left, input_right)
          input[i] = input_right
          input[i + 1] = input_left
          all_correct = false
        end
      end
    end
    input
  end

  def self.find_decoder_key(file)
    # order packets
    packets = order_packets(file)
    # multiply indicies of special packets
    (packets.index(eval('[[2]]')) + 1) * (packets.index(eval('[[6]]')) + 1)
  end

end
