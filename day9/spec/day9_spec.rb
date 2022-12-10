require 'rspec'
require_relative '../lib/day9'

describe 'day 9' do
  it 'part 1 does something' do
    expect(Day9.tail_touch_tally('day9/data/day9example.txt')).to eq(13)
  end
end
