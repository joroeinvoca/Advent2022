require 'rspec'
require_relative '../lib/day11'

describe 'day 11' do
  it 'level of monkey business after 20 rounds (example)' do
    expect(Day11.monkey_business_level('day11/data/day11example.txt', 20)).to eq(10605)
  end

  it 'part 1 real data' do
    expect(Day11.monkey_business_level('day11/data/day11data.txt', 20)).to eq(58794)
  end
end
