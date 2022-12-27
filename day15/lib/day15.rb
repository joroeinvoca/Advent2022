
class Day15
  @beacon_map = {}


  def self.beaconless_locations(file, row, show_map=false)
    @beacon_map = {}
    covered_spots = 0

    File.foreach(file, chomp: true) do |line|
      # sensor
      sensor_x = line[12 .. line.index(',') - 1].to_i
      sensor_y = line[line.index('y=') + 2 .. line.index(':') - 1].to_i
      populate_map(sensor_x, sensor_y, 'S')

      # beacon
      beacon_x = line[line.index('x=', line.index(':')) + 2 .. line.index(', y=', line.index(':')) - 1].to_i
      beacon_y = line[line.index('y=', line.index(':')) + 2 .. -1].to_i
      populate_map(beacon_x, beacon_y, 'B')

      if show_map
        print_map
      end

      dist = calc_dist(sensor_x, sensor_y, beacon_x, beacon_y)
      if [*sensor_y - dist .. sensor_y + dist].include? row
        for x in (sensor_x - dist) .. (sensor_x + dist)
          if calc_dist(sensor_x, sensor_y, x, row) <= dist
            populate_map(x, row, '#')
            if show_map
              print_map
            end
          end
        end
      end
    end
    for i in @beacon_map[row].keys.min .. @beacon_map[row].keys.max
      if @beacon_map[row][i] == '#'
        covered_spots += 1
      end
    end
    covered_spots
  end

  def self.find_tuning_freq(file, max_coord, min_coord=0)
    @beacon_map = {}
    full_rows = []

    File.foreach(file, chomp: true) do |line|
      puts line
      # sensor
      sensor_x = line[12 .. line.index(',') - 1].to_i
      sensor_y = line[line.index('y=') + 2 .. line.index(':') - 1].to_i
      if [*0 .. max_coord].include?(sensor_x) && [*min_coord .. max_coord].include?(sensor_y) && !full_rows.include?(sensor_y)
        populate_map(sensor_x, sensor_y, 'S')
      end

      # beacon
      beacon_x = line[line.index('x=', line.index(':')) + 2 .. line.index(', y=', line.index(':')) - 1].to_i
      beacon_y = line[line.index('y=', line.index(':')) + 2 .. -1].to_i
      if [*0 .. max_coord].include?(beacon_x) && [*min_coord .. max_coord].include?(beacon_y) && !full_rows.include?(beacon_y)
        populate_map(beacon_x, beacon_y, 'B')
      end

      dist = calc_dist(sensor_x, sensor_y, beacon_x, beacon_y)
      puts "dist: #{dist}"

      for y in [(sensor_y - dist), min_coord].max .. [(sensor_y + dist), max_coord].min
        if full_rows.include?(y) || (@beacon_map[y] && @beacon_map[y].values.count > max_coord)
          full_rows << y
          puts "full row: #{y}"
          @beacon_map.delete(y)
          next
        end
        puts "processing y: #{y}"
        for x in [(sensor_x - dist), 0].max .. [(sensor_x + dist), max_coord].min
          if calc_dist(sensor_x, sensor_y, x, y) <= dist
            populate_map(x, y, '#')
          end
        end
      end
    end

    @beacon_map.each do |row_num, x_vals|
      puts row_num
      if x_vals.count == max_coord
        return calc_freq(row_num, [*0 .. max_coord + 1] - x_vals.keys)
      end
    end
    nil
  end

  def self.find_freq_sections(file, max_coord, number_of_sections)
    section_size = max_coord / number_of_sections

    answer = nil
    sections = []

    for i in 0 .. number_of_sections - 1
      answer = find_tuning_freq(file, section_size * (i + 1), section_size * i)
      if answer
        return answer
      end
    end
  end

  def self.calc_freq(y, x)
    x[0] * 4000000 + y
  end

  def self.populate_map(x, y, label)
    if !@beacon_map[y]
      @beacon_map[y] = {}
    end
    if !@beacon_map[y][x]
      @beacon_map[y][x] = label
    end
  end

  def self.calc_dist(x1, y1, x2, y2)
    (x2 - x1).abs + (y2 - y1).abs
  end

  def self.print_map
    y_min = @beacon_map.keys.min
    y_max = @beacon_map.keys.max

    x_min = @beacon_map.values.map(&:keys).flatten.min
    x_max = @beacon_map.values.map(&:keys).flatten.max

    x_min.to_s.chars.each do |char|
      puts(char.rjust(4, ' '))
    end

    for y in y_min .. y_max
      print(y.to_s.rjust(3, ' '))
      for x in x_min .. x_max
        if @beacon_map.dig(y, x)
          print(@beacon_map[y][x])
        else
          print '.'
        end
      end
      puts
    end
    puts
  end

end
