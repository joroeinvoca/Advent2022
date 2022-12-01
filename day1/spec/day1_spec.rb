require 'rspec'
require_relative '../lib/day1'

describe 'day 1' do

  it 'the elfest with the mostest has 24000' do
    expect(Day1.find_most('day1/data/day1example.txt')).to eq(24000)
  end

end
