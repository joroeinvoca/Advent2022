
class Day6alt
  def self.marker_index(input_str, marker_length)
    input_chars = input_str.chars
    input_index = marker_length

    input_chars.each_cons(marker_length) do |marker_chars|
      if marker_chars.uniq == marker_chars
        return input_index
      end
      input_index += 1
    end
  end
end
