
class Day3
  @prio_vals = {}
  ('a'..'z').each_with_index { |letter, i| @prio_vals[letter] = i + 1 }
  ('A'..'Z').each_with_index { |letter, i| @prio_vals[letter] = i + 27 }

  def self.sum_of_priorities(file)
    total = 0

    File.foreach(file) do |line|
      stripped = line.strip
      len = stripped.length
      dup_letter = stripped[0, len/2].chars & stripped[len/2, len].chars
      total += @prio_vals[dup_letter[0]]
    end
    total
  end

  def self.sum_of_group_badges(file)
    total = 0
    group = []

    File.open(file).each_slice(3) do |lines|
      dup_letter = lines[0].chars & lines[1].chars & lines[2].chars
      total += @prio_vals[dup_letter[0]]
    end
    total
  end
end
