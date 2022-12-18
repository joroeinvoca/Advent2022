
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
      elsif pac_left[i].kind_of?(Array)
        result = is_order_correct(pac_left[i], [pac_right[i]])
      elsif pac_right[i].kind_of?(Array)
        result = is_order_correct([pac_left[i]], pac_right[i])
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
end
