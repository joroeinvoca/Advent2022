
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

  @should_result_score = {
    'X' => 0,
    'Y' => 3,
    'Z' => 6
  }

  @should_choose = {
    'A' => {
      'X' => 'Z',
      'Y' => 'X',
      'Z' => 'Y'
    },
    'B' => {
      'X' => 'X',
      'Y' => 'Y',
      'Z' => 'Z'
    },
    'C' => {
      'X' => 'Y',
      'Y' => 'Z',
      'Z' => 'X'
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

  def self.total_score2(file)
    score = 0

    File.foreach(file) do |line|
      split_line = line.split(' ')
      # split_line[0] = opponent's play
      # split_line[1] = result
      # what I play
      score += @my_choice[@should_choose[split_line[0]][split_line[1]]]
      # result
      score += @should_result_score[split_line[1]]
    end
    score
  end
end
