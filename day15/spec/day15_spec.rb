require 'rspec'
require_relative '../lib/day15'

describe 'day 15' do
  it 'part 1 example y=10' do
    expect(Day15.beaconless_locations('day15/data/day15example.txt', 10, false)).to eq(26)
  end

  it 'part 1 real data y=2000000' do
    expect(Day15.beaconless_locations('day15/data/day15data.txt', 2000000)).to eq(4879972)
  end
end
