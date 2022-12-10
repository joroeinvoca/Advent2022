
class Day9
  def self.tail_touch_tally(file)
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
          head_pos[0] -= 1
        when 'D'
          head_pos[0] += 1
        end
        tail_pos = get_new_tail_pos(head_pos, tail_pos)
        if !spots_touched[tail_pos[0]]
          spots_touched[tail_pos[0]] = {}
        end
        spots_touched[tail_pos[0]][tail_pos[1]] = 'x'
      end
    end
    flatten_hash(spots_touched).length
  end

  def self.long_tail_touch_tally(file)
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
          head_pos[0] -= 1
        when 'D'
          head_pos[0] += 1
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
      end
    end
    flatten_hash(spots_touched).length
  end

  def self.flatten_hash(param, prefix=nil)
    param.each_pair.reduce({}) do |a, (k, v)|
      v.is_a?(Hash) ? a.merge(flatten_hash(v, "#{prefix}#{k}.")) : a.merge("#{prefix}#{k}".to_sym => v)
    end
  end

  def self.get_new_tail_pos(hpos, tpos)
    row_diff = hpos[0] - tpos[0]
    col_diff = hpos[1] - tpos[1]

    # same row
    if row_diff == 0
      # move to the right
      if col_diff > 1
        return [tpos[0], tpos[1] + 1]
        # move to the left
      elsif col_diff < -1
        return [tpos[0], tpos[1] - 1]
        end
    elsif col_diff == 0
      # move up
      if row_diff < -1
        return [tpos[0] - 1, tpos[1]]
      # move down
      elsif row_diff > 1
        return [tpos[0] + 1, tpos[1]]
      end

    # too far up
    elsif row_diff < -1
      # & right
      if col_diff == 1
        return [tpos[0] - 1, tpos[1] + 1]
      # & left
      elsif col_diff == -1
        return [tpos[0] - 1, tpos[1] - 1]
      end
    # too far down
    elsif row_diff > 1
      # & right
      if col_diff == 1
        return [tpos[0] + 1, tpos[1] + 1]
      # & left
      elsif col_diff == -1
        return [tpos[0] + 1, tpos[1] - 1]
      end

    # too far right
    elsif col_diff > 1
      # & up
      if row_diff == -1
        return [tpos[0] - 1, tpos[1] + 1]
      # & down
      elsif row_diff == 1
        return [tpos[0] + 1, tpos[1] + 1]
      end
    # too far left
    elsif col_diff < -1
      # & up
      if row_diff == -1
        return [tpos[0] - 1, tpos[1] - 1]
      # & down
      elsif row_diff == 1
        return [tpos[0] + 1, tpos[1] - 1]
      end
    end

    tpos
  end
end
