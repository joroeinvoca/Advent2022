

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

end
