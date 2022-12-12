require 'rspec'
require_relative '../lib/day10'

describe 'day 10' do
  context 'part 1 example' do
    signals = Day10.cycle_signals('day10/data/day10example.txt')

    it '20th cycle' do
      expect(signals[20]).to eq(21)
    end
    it '60th cycle' do
      expect(signals[60]).to eq(19)
    end
    it '100th cycle' do
      expect(signals[100]).to eq(18)
    end
    it '140th cycle' do
      expect(signals[140]).to eq(21)
    end
    it '180th cycle' do
      expect(signals[180]).to eq(16)
    end
    it '220th cycle' do
      expect(signals[220]).to eq(18)
    end

    it 'final result example' do
      expect(Day10.signal_strength(signals, [20, 60, 100, 140, 180, 220])).to eq(13140)
    end

    it 'wrong answer real data' do
      sig = Day10.cycle_signals('day10/data/day10data.txt')
      expect(Day10.signal_strength(sig, [20, 60, 100, 140, 180, 220])).to be < 14560
    end

    it 'real data correct answer' do
      sig = Day10.cycle_signals('day10/data/day10data.txt')
      expect(Day10.signal_strength(sig, [20, 60, 100, 140, 180, 220])).to eq(13440)
    end
  end

  context 'part 2' do
    it 'does something - example' do
      sig = Day10.cycle_signals('day10/data/day10example.txt')
      pix = Day10.populate_pixels(sig)
      expect pix
      expect(Day10.draw_screen(pix))
      puts "\n\n\n"
    end

    it 'does something - real data' do
      sig = Day10.cycle_signals('day10/data/day10data.txt')
      pix = Day10.populate_pixels(sig)
      expect pix
      expect(Day10.draw_screen(pix))
    end
  end
end
