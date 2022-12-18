require 'rspec'
require_relative '../lib/day13'

describe 'day 13' do
  it 'part 1 example' do
    expect(Day13.sum_correct_indicies('day13/data/day13example.txt')).to eq(13)
  end

  it 'part 1 data' do
    expect(Day13.sum_correct_indicies('day13/data/day13data.txt')).to eq(6478)
  end

  context 'part 2' do
    example_answer = <<HEREDOC
[]
[[]]
[[[]]]
[1,1,3,1,1]
[1,1,5,1,1]
[[1],[2,3,4]]
[1,[2,[3,[4,[5,6,0]]]],8,9]
[1,[2,[3,[4,[5,6,7]]]],8,9]
[[1],4]
[[2]]
[3]
[[4,4],4,4]
[[4,4],4,4,4]
[[6]]
[7,7,7]
[7,7,7,7]
[[8,7,6]]
[9]
HEREDOC

    example_arr = []
    example_answer.each_line do |line|
      example_arr << eval(line.chomp)
    end

    it 'put packets in order' do
      # expect(Day13.order_packets('day13/data/day13example.txt').map(&:to_s).map(&:gsub(' ','')).join("\n")).to eq(example_answer)
      expect(Day13.order_packets('day13/data/day13example.txt')).to eq(example_arr)
    end

    it 'finds example decoder key' do
      expect(Day13.find_decoder_key('day13/data/day13example.txt')).to eq(140)
    end
  end
end
