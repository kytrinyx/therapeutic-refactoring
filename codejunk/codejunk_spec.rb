require_relative 'hard_work'

module Codejunk
  alias_method :sanitize, :spurious_hard_work
end

describe Codejunk do

  subject { stub.extend(Codejunk) }

  it "gets rid of spaces" do
    subject.sanitize(" o m g ").should eq('omg')
  end

  it "gets rid of funky characters" do
    subject.sanitize("omg^%#=}{?_").should eq('omg')
  end

  it "gets rid of numbers" do
    subject.sanitize("omg123").should eq('omg')
  end

  it "downcases everything" do
    subject.sanitize("OMG").should eq('omg')
  end

end
