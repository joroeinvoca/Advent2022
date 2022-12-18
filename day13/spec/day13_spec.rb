require 'rspec'
require_relative '../lib/day13'

describe 'day 13' do
  it 'part 1 example' do
    expect(Day13.sum_correct_indicies('day13/data/day13example.txt')).to eq(13)
  end
end
