require 'rspec'
require_relative '../lib/day7'

describe 'day 7' do
  it 'part 1 example' do
    expect(Day7.sum_small_dirs('day7/data/day7example.txt')).to eq(95437)
  end

  it 'part 1 real data' do
    expect(Day7.sum_small_dirs('day7/data/day7data.txt')).to eq(1325919)
  end
end
