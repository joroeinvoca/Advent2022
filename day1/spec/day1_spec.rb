require 'rspec'
require_relative '../lib/day1'

describe 'day 1' do

  it 'the elfest with the mostest has 24000' do
    expect(Day1.find_most('day1/data/day1example.txt')).to eq(24000)
  end

  it 'still works for my actual data, part 1' do
    expect(Day1.find_most('day1/data/day1data.txt')).to eq(75622)
  end

  it 'the total calories of the 3 fattest elves' do
    expect(Day1.find_three_most_total('day1/data/day1example.txt')).to eq(45000)
  end

end
