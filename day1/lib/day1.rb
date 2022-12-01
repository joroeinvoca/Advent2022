

class Day1

  def self.find_most(file)
    max = 0
    current = 0

    File.foreach(file) do |line|
      stripped = line.strip
      unless stripped.empty?
        current += stripped.to_i
      else
        if current > max
          max = current
          current = 0
        end
      end
    end
    max
  end

end
