
class Day4
  def self.complete_overlaps(file)
    overlaps = 0

    File.foreach(file) do |line|
      pairs = line.strip.split(',')
      sections = [pairs[0].split('-').map(&:to_i), pairs[1].split('-').map(&:to_i)]

      # if first section contains second section
      if sections[0][0] <= sections[1][0] && sections[0][1] >= sections[1][1]
        overlaps += 1
      # if second section contains first section
      elsif sections[1][0] <= sections[0][0] && sections[1][1] >= sections[0][1]
        overlaps += 1
      end
    end
    overlaps
  end

  def self.partial_overlaps(file)
    overlaps = 0

    File.foreach(file) do |line|
      pairs = line.strip.split(',')
      sections = [pairs[0].split('-').map(&:to_i), pairs[1].split('-').map(&:to_i)]

      if sections[0][0] <= sections[1][0] && sections[0][1] >= sections[1][0]
        overlaps += 1
      elsif sections[0][0] <= sections[1][1] && sections[0][1] >= sections[1][1]
        overlaps += 1
      elsif sections[1][0] <= sections[0][0] && sections[1][1] >= sections[0][0]
        overlaps += 1
      elsif sections[1][0] <= sections[0][1] && sections[1][1] >= sections[0][1]
        overlaps += 1
      end
    end
    overlaps
  end
end
