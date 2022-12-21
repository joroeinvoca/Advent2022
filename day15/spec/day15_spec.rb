require 'rspec'
require_relative '../lib/day15'

describe 'day 15' do
  it 'part 1 example y=10' do
    expect(Day15.beaconless_locations('day15/data/day15example.txt', 10, true)).to eq(26)
  end
end
