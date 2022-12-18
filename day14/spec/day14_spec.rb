require 'rspec'
require_relative '../lib/day14'

describe 'day 14' do
  it 'part 1 example' do
    expect(Day14.how_much_sand('day14/data/day14example.txt')).to eq(24)
  end
end
