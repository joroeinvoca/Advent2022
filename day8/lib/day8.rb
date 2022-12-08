
class Day8
  def self.make_forest(file)
    trees = []
    row = 0
    File.foreach(file, chomp: true) do |line|
      trees[row] = line.chars.map(&:to_i)
      row += 1
    end
    trees
  end

  def self.count_visible_trees(file)
    trees = make_forest(file)
    sum = 0
    #count edge trees
    sum += 2*trees.size
    sum += 2*trees[0].size
    sum -= 4 # haha

    for row in 1 .. trees.size - 2 do
      for tree in 1 .. trees[0].size - 2 do
        current = trees[row][tree]
        if current > trees[row][0 .. tree - 1].max || current > trees[row][tree + 1 .. -1].max
          sum += 1
        else
          above = []
          below = []

          for i in 0 .. row - 1 do
            above << trees[i][tree]
          end

          for i in row + 1 .. trees.size - 1 do
            below << trees[i][tree]
          end

          if current > above.max || current > below.max
            sum += 1
          end
        end
      end
    end
    sum
  end
end
