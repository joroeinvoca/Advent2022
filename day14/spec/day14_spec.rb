require 'rspec'
require_relative '../lib/day14'

describe 'day 14' do
  it 'part 1 example' do
    expect(Day14.how_much_sand('day14/data/day14example.txt')).to eq(24)
  end

  it 'part 1 data' do
    expect(Day14.how_much_sand('day14/data/day14data.txt')).to eq(1199)
  end

  it 'part 2 example' do
    expect(Day14.how_much_sand('day14/data/day14example.txt', true)).to eq(93)
  end
end
