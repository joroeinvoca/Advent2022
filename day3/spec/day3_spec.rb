require 'rspec'
require_relative '../lib/day3'

describe 'day 3' do
  it 'example data sum' do
    expect(Day3.sum_of_priorities('day3/data/day3example.txt')).to eq(157)
  end

  it 'still works for real data part 1' do
    expect(Day3.sum_of_priorities('day3/data/day3data.txt')).to eq(7889)
  end

  it 'example data part 2' do
    expect(Day3.sum_of_group_badges('day3/data/day3example.txt')).to eq(70)
  end
end
