module Codejunk

  def spurious_hard_work(s = "I <3 Magic!")
    s.gsub(/[^a-z]/i, '').downcase
  end

  def spurious_transformations
    [1, 2, 3].map(&:to_s).join
  end

  def spurious_complexity
    s = rand(2) == 0 ? "abcde" : "abc"
    cutoff = s.length > 4 ? 4 : s.length
    s[0..cutoff]
  end

  def spurious_stringification
    "I am #{age.to_s} years old"
  end

  def age
    rand(25) + 15
  end

end
