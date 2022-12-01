

class Day1

  def self.find_most(file)
    max = 0
    current = 0

    File.foreach(file) do |line|
      if stripped = line.strip
        current += stripped.to_i
      else
        if current > max
          max = current
        end
      end
    end
    max
  end

end
