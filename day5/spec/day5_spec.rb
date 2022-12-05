require 'rspec'
require_relative '../lib/day5'

describe 'day 5' do
  context 'part 1' do
    result = Day5.crate_results('day5/data/day5example.txt', false)

    it 'final crate positions' do
      expect(result).to include(1 => ['C'])
      expect(result).to include(2 => ['M'])
      expect(result).to include(3 => ['Z', 'N', 'D', 'P'])
    end

    it 'crates on top' do
      expect(Day5.crates_on_top(result)).to eq('CMZ')
    end
  end

  context 'part 2' do
    result = Day5.crate_results('day5/data/day5example.txt', true)

    it 'crates on top' do
      expect(Day5.crates_on_top(result)).to eq('MCD')
    end
  end
end
