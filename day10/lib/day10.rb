
class Day10
  def self.cycle_signals(file)
    cycle = 1
    register = 1
    signal = {cycle => register}

    File.foreach(file, chomp: true) do |line|
      cycle += 1
      inst = line.split(' ')[0]
      signal[cycle] = register

      if inst == 'addx'
        cycle += 1
        val = line.split(' ')[1].to_i
        register += val
        signal[cycle] = register
      end
    end
    signal
  end

  def self.signal_strength(signal_hash, cycle_arr)
    value = 0
    cycle_arr.each do |cycle|
      value += (signal_hash[cycle] * cycle)
    end
    value
  end

  def self.populate_pixels(signals)
    picture = {}
    line = 0

    for pix in 0 .. signals.keys.max
      cycle = pix + 1
      if pix != 0 && pix % 40 == 0
        line += 1
      end
      if signals[cycle] == (pix - line * 40) || signals[cycle] == (pix - line * 40) - 1 || signals[cycle] == (pix - line * 40) + 1
        picture[pix] = '#'
      else
        picture[pix] = '.'
      end
    end
    picture
  end

  def self.draw_screen(screen_hash)
    for i in 0 .. screen_hash.keys.max
      if i != 0 && i % 40 == 0
        print("\n")
      end
      print(screen_hash[i])
    end
  end
end
