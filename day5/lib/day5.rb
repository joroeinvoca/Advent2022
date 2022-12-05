
class Day5
  def self.whats_on_top(file)
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
      elsif !line.strip.empty?

      end
    end
    stacks
  end
end
