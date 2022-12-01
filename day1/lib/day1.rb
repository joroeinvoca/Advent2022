

class Day1

  def self.find_most(file)
    max = 0
    current = 0

    File.foreach(file) do |line|
      stripped = line.strip
      if stripped.empty?
        if current > max
          max = current
        end
        current = 0
      else
        current += stripped.to_i
      end
    end
    max
  end

  def self.find_three_most_total(file)
    max_three = []
    current = 0

    File.foreach(file) do |line|
      stripped = line.strip
      if stripped.empty? ||
        if max_three.size < 3
          max_three << current
        else
        max_three.sort!.reverse!.each_with_index do |val, ind|
          if current > val
            max_three = max_three.take(2)
            max_three << current
            break
          end
        end
        end
        current = 0
      else
        current += stripped.to_i
      end
    end
    max_three.sum
  end

end
