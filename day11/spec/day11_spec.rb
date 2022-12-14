require 'rspec'
require_relative '../lib/day11'

describe 'day 11' do
  it 'level of monkey business after 20 rounds (example)' do
    expect(Day11.monkey_business_level('day11/data/day11example.txt')).to eq(10605)
  end
end
