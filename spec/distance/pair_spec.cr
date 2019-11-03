require "../spec_helper"

describe Cadmium::Distance::Pair do
  subject = Cadmium::Distance::Pair

  it "should evaluate string similarity" do
    subject.distance("DIXON", "DICKSONX").should be_close(0.36363, 0.00001)
    subject.distance("DWAYNE", "DUANE").should be_close(0.22222, 0.001)
  end

  it "should handle exact matches" do
    subject.distance("RICK", "RICK").should eq(1)
    subject.distance("abc", "abc").should eq(1)
    subject.distance("abcd", "abcd").should eq(1)
    subject.distance("seddon", "seddon").should eq(1)
  end

  it "should handle total mismatches" do
    subject.distance("NOT", "SAME").should eq(0)
  end
end
