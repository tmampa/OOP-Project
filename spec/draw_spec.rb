require './lib/draw_logic'

describe Draw do
  describe '#draw?' do
    let(:draw) { Draw.new(%w[X X O X O O X O X]) }
    let(:not_draw) { Draw.new(['X', 'X', 'O', 4, 5, 6, 7, 8, 9]) }

    it 'should return true if board contains strings' do
      expect(draw.draw?).to be true
    end

    it 'should return false if board contains integers' do
      expect(not_draw.draw?).to be false
    end
  end
end
