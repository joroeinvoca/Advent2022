
class Day5
  def self.crate_results(file)
    stacks = {}

    File.foreach(file) do |line|
      if line.include?('[')
        stack_ind = 1
        line_chars = line.chars
        while line_chars.length > 0
          if !line_chars[1].strip.empty?
            if !stacks.has_key?(stack_ind)
              stacks[stack_ind] = []
            end
              stacks[stack_ind] << line_chars[1]
          end
          stack_ind += 1
          line_chars = line_chars.drop(4)
        end
      elsif line.include?('move')
        instructions = line.split(' ')
        # instructions[0] => 'move'
        # [1] => number of crates
        # [2] => 'from'
        # [3] => starting stack
        # [4] => 'to'
        # [5] => ending stack
        # int some things
        instructions[1] = instructions[1].to_i
        instructions[3] = instructions[3].to_i
        instructions[5] = instructions[5].to_i
        # do stuff number of times of crates to move
        instructions[1].times {
          # put the crate we're removing (shift) onto the destination stack (unshift)
          stacks[instructions[5]].unshift(stacks[instructions[3]].shift)
        }
      end
    end
    stacks
  end

  def self.crates_on_top(stacks)
    result = ''
    for i in 1 .. stacks.size do
      result << stacks[i].first
    end
    result
  end
end
