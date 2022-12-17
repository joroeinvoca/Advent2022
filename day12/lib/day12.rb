
class Day12
  # S == a
  # E == z



  def self.find_path(file)
    @heightmap = {}
    @letters = [*('a'..'z')]
    @route_values = {}

    cur_row = 0
    start_pos = []
    goal_pos = []

    File.foreach(file, chomp: true) do |line|
      @heightmap[cur_row] = {}
      line.chars.each_with_index { |val, i| @heightmap[cur_row][i] = val }

      if s_pos = line.chars.index('S')
        start_pos = [cur_row, s_pos]
        @heightmap[cur_row][s_pos] = 'a'
      end

      if g_pos = line.chars.index('E')
        goal_pos = [cur_row, g_pos]
        @heightmap[cur_row][g_pos] = 'z'
      end

      cur_row += 1
    end

    visited = {}

    @heightmap.each do |row_num, row|
      @route_values[row_num] = {}
      visited[row_num] = {}
      row.each do |col_num, col|
        @route_values[row_num][col_num] = nil
        visited[row_num][col_num] = 0
      end
    end

    @route_values[start_pos[0]][start_pos[1]] = 0
    visited[start_pos[0]][start_pos[1]] = 1

    cur_pos = start_pos

    loop do
      values = {}
      # up?
      up_coords = [cur_pos[0] - 1, cur_pos[1]]
      if dug = visited.dig(up_coords[0], up_coords[1]) && dug != 1
        if route_val = check_route(cur_pos, up_coords)
          values[up_coords] = route_val
        end
      end

      # right
      right_coords = [cur_pos[0], cur_pos[1] + 1]
      if dug = visited.dig(right_coords[0], right_coords[1]) && dug != 1
        if route_val = check_route(cur_pos, right_coords)
              values[right_coords] = route_val
        end
      end

      # down
      down_coords = [cur_pos[0] + 1, cur_pos[1]]
      if dug = visited.dig(down_coords[0], down_coords[1]) && dug != 1
        if route_val = check_route(cur_pos, down_coords)
          values[down_coords] = route_val
        end
      end

      # left
      left_coords = [cur_pos[0], cur_pos[1] - 1]
      if visited.dig(left_coords[0], left_coords[1]) != 1
        if route_val = check_route(cur_pos, left_coords)
          values[left_coords] = route_val
        end
      end

      visited[cur_pos[0]][cur_pos[1]] = 1

      if visited.dig(goal_pos[0], goal_pos[1]) == 1
        return @route_values.dig(goal_pos[0], goal_pos[1])
      end

      if values.size > 0
        cur_pos = values.min_by{ |k, v| v }[0]
      else
        raise('hell')
      end
    end
  end

  def self.check_route(cur_pos, coords_to_check)
    if check_val = @heightmap.dig(coords_to_check[0], coords_to_check[1])
      # If it is a height we can travel to
      if @letters.index(check_val) <= (@letters.index(@heightmap[cur_pos[0]][cur_pos[1]]) + 1)
        new_val = @route_values.dig(cur_pos[0], cur_pos[1]) + 1
        # If the up position value is nil or > the newly calculated one
        route_cur_val = @route_values.dig(coords_to_check[0], coords_to_check[1])
        if !route_cur_val || route_cur_val > new_val
          # put the new value in route_values
          @route_values[coords_to_check[0]][coords_to_check[1]] = new_val
          return new_val
        end
      end
    end
  end

end
