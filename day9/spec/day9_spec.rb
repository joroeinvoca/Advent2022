require 'rspec'
require_relative '../lib/day9'

describe 'day 9' do
  it 'part 1 does something' do
    expect(Day9.tail_touch_tally('day9/data/day9example.txt')).to eq(13)
  end

  it 'part 1 works with real data too' do
    expect(Day9.tail_touch_tally('day9/data/day9data.txt')).to eq(6011)
  end

  it 'part 2 example data' do
    expect(Day9.long_tail_touch_tally('day9/data/day9example.txt')).to eq(1)
  end
end
