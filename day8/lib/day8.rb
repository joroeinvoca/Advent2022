
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

  def self.highest_scenic_score(file)
    trees = make_forest(file)
    max = 0

    for row in 1..trees.size - 2 do
      for tree in 1..trees[0].size - 2 do
        up = []
        down = []
        left = []
        right = []
        current = trees[row][tree]
        left = trees[row][0..tree - 1].reverse
        right =trees[row][tree + 1..-1]

        for i in 0..row - 1 do
          up << trees[i][tree]
        end

        for i in row + 1..trees.size - 1 do
          down << trees[i][tree]
        end

        up.reverse!

        current_max = trees_can_see(current, up) * trees_can_see(current, down) * trees_can_see(current, left) * trees_can_see(current, right)
        if current_max > max
          max = current_max
        end
      end
    end
    max
  end

  def self.trees_can_see(current, tree_arr)
    tree_count = 0
    tree_arr.each do |tree|
        tree_count += 1
      break if current <= tree
    end
    tree_count
  end
end
