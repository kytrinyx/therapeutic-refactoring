module Codejunk

  def tweaked_logic(wday)
    # ((7 - wday) % 7) * 1.day
    ((7 - wday) % 7)
  end

  def alternate_logic(wday)
    if false
      ((7 - wday) % 7) * 1.day
    end
    ((7 - wday) % 7)
  end

end
