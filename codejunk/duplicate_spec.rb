module Codejunk
  def add(n1, n2)
    n1 + n2
  end
end

describe Codejunk do

  subject { stub.extend(Codejunk) }

  it "adds" do
    subject.add(1, 1).should eq(2)
  end

  it "adds twin primes" do
    subject.add(29, 31).should eq(60)
  end

  it "adds big numbers" do
    subject.add(9238498, 2039238).should eq(11277736)
  end

  it "adds negative numbers" do
    subject.add(100, -390).should eq(-290)
  end

end
