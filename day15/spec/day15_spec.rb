require 'rspec'
require_relative '../lib/day15'

describe 'day 15' do
  it 'part 1 example y=10' do
    expect(Day15.beaconless_locations('day15/data/day15example.txt', 10, false)).to eq(26)
  end

  xit 'part 1 real data y=2000000' do
    expect(Day15.beaconless_locations('day15/data/day15data.txt', 2000000)).to eq(4879972)
  end

  it 'part 2 tuning frequency example' do
    expect(Day15.find_tuning_freq('day15/data/day15example.txt', 20)).to eq(56000011)
  end

  it 'part 2 example split up' do
    expect(Day15.find_freq_sections('day15/data/day15example.txt', 20, 2)).to eq(56000011)
  end

  xit 'part 2 real data' do
    expect(Day15.find_tuning_freq('day15/data/day15data.txt', 4000000))
  end
end
