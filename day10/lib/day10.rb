
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
end
