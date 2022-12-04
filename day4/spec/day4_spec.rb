require 'rspec'
require_relative '../lib/day4'

describe 'day4' do
  it 'part 1 example data' do
    expect(Day4.complete_overlaps('day4/data/day4example.txt')).to eq(2)
  end

  it 'part 1 real data' do
    expect(Day4.complete_overlaps('day4/data/day4data.txt')).to eq(542)
  end
end
