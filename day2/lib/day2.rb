
# A = Rock
# B = Paper
# C = Scissors
#
# x = Rock = 1
# Y = Paper = 2
# Z = Scissors = 3
#
# Loss = 0
# Draw = 3
# Win = 6


class Day2
  @my_choice = {
    'X' => 1,
    'Y' => 2,
    'Z' => 3
  }

  @result_score = {
    'A' => {
      'X' => 3,
      'Y' => 6,
      'Z' => 0
    },
    'B' => {
      'X' => 0,
      'Y' => 3,
      'Z' => 6
    },
    'C' => {
      'X' => 6,
      'Y' => 0,
      'Z' => 3
    }
  }

  def self.total_score(file)
    score = 0

    File.foreach(file) do |line|
      split_line = line.split(' ')
      score += @result_score[split_line[0]][split_line[1]]
      score += @my_choice[split_line[1]]
    end
    score
  end
end
