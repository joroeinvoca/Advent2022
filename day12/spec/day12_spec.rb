require 'rspec'
require_relative '../lib/day12'

describe 'day 12' do
  it 'lowest number of steps in example (part 1)' do
    expect(Day12.find_shortest_path_from('day12/data/day12example.txt')).to eq(31)
  end

  it 'real data part 1' do
    expect(Day12.find_shortest_path_from('day12/data/day12data.txt')).to eq(520)
  end

  it 'part 2 example' do
    expect(Day12.find_shortest_path_from('day12/data/day12example.txt', true)).to eq(29)
  end
end
