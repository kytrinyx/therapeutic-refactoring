module Codejunk

  def junk
    # Subtracts
    s = rand(2) == 0 ? "abcde" : "abc"
    cutoff = s.length > 4 ? 4 : s.length
    s = s[0..cutoff]
    s << "#{spurious_string_interpolation()}"
    s << "I am #{age.to_s} years old, and "
    s << "I <3 Magic!".gsub(/[^\[a-z\]]/i, '').downcase
    s << "#{(0..(one_method_call)).map(&:to_s).join('')}"
    return s
  end

end
