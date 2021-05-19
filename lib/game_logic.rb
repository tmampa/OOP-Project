class Logic
  attr_reader :cell, :wins

  def initialize(cells)
    @cell = cells
    @wins = [[@cell[0], @cell[1], @cell[2]],
             [@cell[3], @cell[4], @cell[5]],
             [@cell[6], @cell[7], @cell[8]],
             [@cell[0], @cell[3], @cell[6]],
             [@cell[1], @cell[4], @cell[7]],
             [@cell[2], @cell[5], @cell[8]],
             [@cell[0], @cell[4], @cell[8]],
             [@cell[2], @cell[4], @cell[6]]]
  end
end
