require 'rspec'
require_relative '../lib/day2'

describe 'day 2' do
  it 'example total score' do
    expect(Day2.total_score('day2/data/day2example.txt')).to eq(15)
  end

  it 'real data total score' do
    expect(Day2.total_score('day2/data/day2data.txt')).to eq(9177)
  end

  it 'example data part 2 total score' do
    expect(Day2.total_score2('day2/data/day2example.txt')).to eq(12)
  end
end
