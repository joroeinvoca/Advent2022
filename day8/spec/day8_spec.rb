require 'rspec'
require_relative '../lib/day8'

describe 'day 8' do
  it 'part 1 example' do
    expect(Day8.count_visible_trees('day8/data/day8example.txt')).to eq(21)
  end

  it 'part 2 example' do
    expect(Day8.highest_scenic_score('day8/data/day8example.txt')).to eq(8)
  end
end
