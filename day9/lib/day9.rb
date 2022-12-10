
class Day9
  def self.tail_touch_tally(file, print = false)
    spots_touched = {0 => {0 => 'x'}}

    tail_pos = [0, 0]
    head_pos = [0, 0]

    File.foreach(file, chomp: true) do |line|
      inst = line.split(' ')
      inst[1] = inst[1].to_i
      inst[1].times do
        case inst[0]
        when 'R'
          head_pos[1] += 1
        when 'L'
          head_pos[1] -= 1
        when 'U'
          head_pos[0] += 1
        when 'D'
          head_pos[0] -= 1
        end
        tail_pos = get_new_tail_pos(head_pos, tail_pos)
        if !spots_touched[tail_pos[0]]
          spots_touched[tail_pos[0]] = {}
        end
        spots_touched[tail_pos[0]][tail_pos[1]] = 'x'
        if print
          puts(inst[0] + '|')
          print_danger_noodle({'H' => head_pos, 'T' => tail_pos})
        end
      end
    end
    flatten_hash(spots_touched).length
  end

  def self.long_tail_touch_tally(file, print= false)
    spots_touched = {0 => {0 => 'x'}}

    head_pos = [0, 0]
    t1_pos = [0, 0]
    t2_pos = [0, 0]
    t3_pos = [0, 0]
    t4_pos = [0, 0]
    t5_pos = [0, 0]
    t6_pos = [0, 0]
    t7_pos = [0, 0]
    t8_pos = [0, 0]
    t9_pos = [0, 0]

    File.foreach(file, chomp: true) do |line|
      inst = line.split(' ')
      inst[1] = inst[1].to_i
      inst[1].times do
        case inst[0]
        when 'R'
          head_pos[1] += 1
        when 'L'
          head_pos[1] -= 1
        when 'U'
          head_pos[0] += 1
        when 'D'
          head_pos[0] -= 1
        end
        t1_pos = get_new_tail_pos(head_pos, t1_pos)
        t2_pos = get_new_tail_pos(t1_pos, t2_pos)
        t3_pos = get_new_tail_pos(t2_pos, t3_pos)
        t4_pos = get_new_tail_pos(t3_pos, t4_pos)
        t5_pos = get_new_tail_pos(t4_pos, t5_pos)
        t6_pos = get_new_tail_pos(t5_pos, t6_pos)
        t7_pos = get_new_tail_pos(t6_pos, t7_pos)
        t8_pos = get_new_tail_pos(t7_pos, t8_pos)
        t9_pos = get_new_tail_pos(t8_pos, t9_pos)

        if !spots_touched[t9_pos[0]]
          spots_touched[t9_pos[0]] = {}
        end
        spots_touched[t9_pos[0]][t9_pos[1]] = 'x'
        if print
          puts(inst[0] + '|')
          print_danger_noodle(
            {
              'H' => head_pos,
              '1' => t1_pos,
              '2' => t2_pos,
              '3' => t3_pos,
              '4' => t4_pos,
              '5' => t5_pos,
              '6' => t6_pos,
              '7' => t7_pos,
              '8' => t8_pos,
              '9' => t9_pos
            }
          )
        end
      end
    end
    flatten_hash(spots_touched).length
  end

  def self.flatten_hash(param, prefix=nil)
    param.each_pair.reduce({}) do |a, (k, v)|
      v.is_a?(Hash) ? a.merge(flatten_hash(v, "#{prefix}#{k}.")) : a.merge("#{prefix}#{k}".to_sym => v)
    end
  end

  def self.print_danger_noodle(positions)
    all_points = {}

    col_max = 0
      points = positions.values
    points.each do |coord|
      if coord[1] > col_max
        col_max = coord[1]
      end
    end



    positions.each do |name, pos|
      if !all_points[pos[0]]
        all_points[pos[0]] = {}
      end
      if all_points[pos[0]][pos[1]]
        all_points[pos[0]][pos[1]] = 'X'
      else
        all_points[pos[0]][pos[1]] = name
      end
    end
    all_points.keys.max.downto(0) do |row|
      print("#{row}|")
      for col in 0 .. col_max
        if all_points[row] && all_points[row][col]
          print(all_points[row][col])
          else
            print( '.')
        end
      end
      puts "\n"
    end

    col_max.times do
      print('-')
    end
    puts "---\n"
    puts "  #{[*0..col_max].join}\n\n"
  end

  def self.get_new_tail_pos(hpos, tpos)
    row_diff = hpos[0] - tpos[0]
    col_diff = hpos[1] - tpos[1]

    if row_diff.abs < 2 && col_diff.abs < 2
      return tpos
    end

    if row_diff == 0
      return [tpos[0], tpos[1] + (col_diff <=> 1)]
    elsif col_diff == 0
      return [tpos[0] + (row_diff <=> 1), tpos[1]]
    elsif col_diff.abs == 1
      return [tpos[0] + (row_diff <=> 1), tpos[1] + (col_diff <=> 0)]
    elsif row_diff.abs == 1
      return [tpos[0] + (row_diff <=> 0), tpos[1] + (col_diff <=> 1)]
    else
      get_new_tail_pos(hpos, [tpos[0] + (row_diff <=> 1), tpos[1] + (col_diff <=> 1)])
    end

  end
end
