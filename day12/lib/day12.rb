
class Day12
  # S == a
  # E == z



  def self.load_scenario(file)
    @heightmap = {}
    @letters = [*('a'..'z')]
    @route_values = {}
    @visited = {}
    @queue_to_check = []

    cur_row = 0
    start_pos = []
    @goal_pos = []

    File.foreach(file, chomp: true) do |line|
      @heightmap[cur_row] = {}
      line.chars.each_with_index { |val, i| @heightmap[cur_row][i] = val }

      if (s_pos = line.chars.index('S'))
        start_pos = [cur_row, s_pos]
        @heightmap[cur_row][s_pos] = 'a'
      end

      if (g_pos = line.chars.index('E'))
        @goal_pos = [cur_row, g_pos]
        @heightmap[cur_row][g_pos] = 'z'
      end

      cur_row += 1
    end

    @heightmap.each do |row_num, row|
      @route_values[row_num] = {}
      @visited[row_num] = {}
      row.each do |col_num, col|
        @route_values[row_num][col_num] = nil
        @visited[row_num][col_num] = 0
      end
    end

    @queue_to_check << start_pos
    @route_values[start_pos[0]][start_pos[1]] = 0
  end

  def self.find_shortest_path_from(file, multiple_starts = false)
    load_scenario(file)

    if multiple_starts
      @heightmap.each do |row_num, row|
        row.each do |col_num, val|
          if val == 'a'
            @queue_to_check << [row_num, col_num]
            @route_values[row_num][col_num] = 0
          end
        end
      end
    end

    while @queue_to_check.size > 0
      if @visited.dig(@goal_pos[0], @goal_pos[1]) == 1
        return @route_values.dig(@goal_pos[0], @goal_pos[1])
      end

      check_directions(@queue_to_check.shift)
    end

    @route_values.dig(@goal_pos[0], @goal_pos[1])
  end

  def self.check_directions(cur_pos)
    adjoining_values = {}

    # up?
    up_coords = [cur_pos[0] - 1, cur_pos[1]]
    if @visited.dig(up_coords[0], up_coords[1]) && @visited.dig(up_coords[0], up_coords[1]) != 1
      route_val = check_route(cur_pos, up_coords)
      if route_val
        adjoining_values[up_coords] = route_val
      end
    end

    # right
    right_coords = [cur_pos[0], cur_pos[1] + 1]
    if @visited.dig(right_coords[0], right_coords[1]) && @visited.dig(right_coords[0], right_coords[1]) != 1
      route_val = check_route(cur_pos, right_coords)
      if route_val
        adjoining_values[right_coords] = route_val
      end
    end

    # down
    down_coords = [cur_pos[0] + 1, cur_pos[1]]
    if @visited.dig(down_coords[0], down_coords[1]) && @visited.dig(down_coords[0], down_coords[1]) != 1
      route_val = check_route(cur_pos, down_coords)
      if route_val
        adjoining_values[down_coords] = route_val
      end
    end

    # left
    left_coords = [cur_pos[0], cur_pos[1] - 1]
    if @visited.dig(left_coords[0], left_coords[1]) && @visited.dig(left_coords[0], left_coords[1]) != 1
      route_val = check_route(cur_pos, left_coords)
      if route_val
        adjoining_values[left_coords] = route_val
      end
    end

    if adjoining_values.size > 0
      min = adjoining_values.values.min
      adjoining_values.each do |k, v|
        if v == min
          @queue_to_check << k
        end
      end
    end

    @visited[cur_pos[0]][cur_pos[1]] = 1
  end

  def self.check_route(cur_pos, coords_to_check)
    if (check_val = @heightmap.dig(coords_to_check[0], coords_to_check[1]))
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
