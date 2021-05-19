class Draw
  attr_reader :cell

  def initialize(cells)
    @cell = cells
  end

  def draw?
    @cell.all? do |item|
      item.is_a?(String)
    end
  end
end
