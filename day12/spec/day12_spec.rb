require 'rspec'
require_relative '../lib/day12'

describe 'day 12' do
  it 'lowest number of steps in example (part 1)' do
    expect(Day12.find_path('day12/data/day12example.txt')).to eq(31)
  end
end
