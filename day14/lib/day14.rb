
class Day14
  def self.how_much_sand(file, add_floor=false)
    cave_map = {}

    File.foreach(file, chomp:true) do |line|
      points = line.split(' -> ')
      for i in 0 .. points.size - 2
          start_coords = points[i].split(',').map(&:to_i)
          end_coords = points[i + 1].split(',').map(&:to_i)

          # horizontal line
          if start_coords[1] == end_coords[1]
            for vert in [start_coords[0], end_coords[0]].min .. [start_coords[0], end_coords[0]].max do
              if !cave_map[start_coords[1]]
                cave_map[start_coords[1]] = {}
              end
              cave_map[start_coords[1]][vert] = '#'
            end
          # vertical line
          elsif start_coords[0] == end_coords[0]
            for horiz in [start_coords[1], end_coords[1]].min .. [start_coords[1], end_coords[1]].max do
              if !cave_map[horiz]
                cave_map[horiz] = {}
              end
              cave_map[horiz][start_coords[0]] = '#'
            end
          else
            raise :eyebrows
          end
      end
    end

    # need to put the first empty row in the cave_map
    cave_map[0] = {}

    # optionally add the floor
    if add_floor
      lowest_level = cave_map.keys.max
      cave_map[lowest_level + 2] = {}
      for floor in cave_map[lowest_level].keys.min - 200 .. cave_map[lowest_level].keys.max + 200 do
        cave_map[lowest_level + 2][floor] = '#'
      end
    end

    grains = 0
    done = false
    loop do
      sand_pos = [500, 0]

      loop do
        starting_pos = sand_pos

        if cave_map[sand_pos[1] + 1]
          # down
          if !cave_map[sand_pos[1] + 1][sand_pos[0]]
            sand_pos = [sand_pos[0], sand_pos[1] + 1]
          # down & left
          elsif !cave_map[sand_pos[1] + 1][sand_pos[0] - 1]
            sand_pos = [sand_pos[0] - 1, sand_pos[1] + 1]
          # down & right
          elsif !cave_map[sand_pos[1] + 1][sand_pos[0] + 1]
            sand_pos = [sand_pos[0] + 1, sand_pos[1] + 1]
          # sand has landed
          else
            cave_map[sand_pos[1]][sand_pos[0]] = 'o'
            if sand_pos == [500, 0]
              grains += 1
              break done = true
            end
          end
        # also down, but filling out empty cave map
        else
          cave_map[sand_pos[1] + 1] = {}
          sand_pos = [sand_pos[0], sand_pos[1] + 1]
        end

        if sand_pos == starting_pos
          break
        end

        if (sand_pos[1] + 1) > cave_map.keys.max
          break done = true
        end

      end

      if done
        break
      end

      grains += 1
    end
    print_cave(cave_map)
    grains
  end

  def self.print_cave(cave_map)
    for row in cave_map.keys.min .. cave_map.keys.max do
      for col in cave_map[cave_map.keys.max].keys.min .. cave_map[cave_map.keys.max].keys.max do
        if cave_map[row][col]
          print(cave_map[row][col])
        else
          print('.')
        end
      end
      print("\n")
    end
    print("\n")
  end
end
