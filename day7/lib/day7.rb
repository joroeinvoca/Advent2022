
class Day7
  @filesystem = {}

  def self.sum_small_dirs(file)
    current_dir = []

    File.foreach(file, chomp: true) do |line|
      split_line = line.split(' ')
      if split_line[0] == '$'
        if split_line[1] == 'cd'
          if split_line[2] == '..'
            current_dir.pop
          else
            current_dir << split_line[2]
          end
        end
      elsif split_line[0] != 'dir'
        tmp_dir = ''
        current_dir.each do |dir|
          tmp_dir += '/' + dir
          if !@filesystem.include?(tmp_dir)
            @filesystem[tmp_dir] = 0
          end
          @filesystem[tmp_dir] += split_line[0].to_i
        end
      end
    end
    total = 0
    @filesystem.each do |folder, size|
      if size <= 100000
        total += size
      end
    end
    total
  end
end
