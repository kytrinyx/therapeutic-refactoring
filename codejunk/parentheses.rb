module Codejunk

  def unnecessary_parentheses()
    junk()
  end

  def more_spurious_parentheses
    (0..(one_method_call)).to_a
  end

  def one_method_call
    (10 - rand(10))
  end

end
