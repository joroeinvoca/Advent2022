require 'rspec'
require_relative '../lib/day2'

describe 'day 2' do
  it 'example total score' do
    expect(Day2.total_score('day2/data/day2example.txt')).to eq(15)
  end
end
