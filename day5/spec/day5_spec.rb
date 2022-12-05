require 'rspec'
require_relative '../lib/day5'

describe 'day 5' do
  result = Day5.crate_results('day5/data/day5example.txt')

  it 'day 5 part 1 crate positions' do
    expect(result).to include(1 => ['C'])
    expect(result).to include(2 => ['M'])
    expect(result).to include(3 => ['Z', 'N', 'D', 'P'])
  end

  it 'day 5 part 1 crates on top' do
    expect(Day5.crates_on_top(result)).to eq('CMZ')
  end
end
