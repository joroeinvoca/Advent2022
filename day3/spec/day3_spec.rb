require 'rspec'
require_relative '../lib/day3'

describe 'day 3' do
  it 'example data sum' do
    expect(Day3.sum_of_priorities('day3/data/day3example.txt')).to eq(157)
  end
end
