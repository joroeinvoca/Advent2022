
class Day6
  def self.marker_index(input_str, marker_length)
    input_chars = input_str.chars

    marker_chars = input_chars.shift(marker_length)
    input_index = marker_length

    loop do
      if marker_chars.uniq == marker_chars
        return input_index
      else
        marker_chars = marker_chars.drop(1)
        marker_chars << input_chars[0]
        input_chars = input_chars.drop(1)
        input_index += 1
      end
    end
  end
end
