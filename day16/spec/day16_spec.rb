require 'rspec'
require_relative '../lib/day16'

describe 'day 16' do
  it 'part 1 example' do
    expect(Day16.max_pressure_to_release('day16/data/day16example.txt')).to eq(1651)
  end
end
