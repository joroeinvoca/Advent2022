require 'rspec'
require_relative '../lib/day6'

describe 'day 6' do
  it 'part 1' do
    expect(Day6.marker_index('mjqjpqmgbljsphdztnvjfqwrcgsmlb', 4)).to eq(7)
    expect(Day6.marker_index('bvwbjplbgvbhsrlpgdmjqwftvncz', 4)).to eq(5)
    expect(Day6.marker_index('nppdvjthqldpwncqszvftbrmjlhg', 4)).to eq(6)
    expect(Day6.marker_index('nznrnfrfntjfmvfwmzdfjlvtqnbhcprsg', 4)).to eq(10)
    expect(Day6.marker_index('zcfzfwzzqfrljwzlrfnpqdbhtmscgvjw', 4)).to eq(11)
  end

  it 'part 1 real data' do
    input = File.read('day6/data/day6data.txt')
    expect(Day6.marker_index(input, 4)).to eq(1275)
  end

  it 'part 2' do
    expect(Day6.marker_index('mjqjpqmgbljsphdztnvjfqwrcgsmlb', 14)).to eq(19)
    expect(Day6.marker_index('bvwbjplbgvbhsrlpgdmjqwftvncz', 14)).to eq(23)
    expect(Day6.marker_index('nppdvjthqldpwncqszvftbrmjlhg', 14)).to eq(23)
    expect(Day6.marker_index('nznrnfrfntjfmvfwmzdfjlvtqnbhcprsg', 14)).to eq(29)
    expect(Day6.marker_index('zcfzfwzzqfrljwzlrfnpqdbhtmscgvjw', 14)).to eq(26)
  end
end
