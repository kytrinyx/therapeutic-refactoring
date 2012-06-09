module Codejunk

  def tweaked_logic(wday)
    # ((7 - wday) % 7) * 1.day
    ((7 - wday) % 7)
  end

end
