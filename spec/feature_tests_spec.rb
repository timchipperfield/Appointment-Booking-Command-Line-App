require "spec_helper"

describe "the command line application itself" do

  after :all do
    write_json_back_to_normal
  end

  context "when entering a single valid time" do


    it "returns the correct time for the am" do
      expect(test_availability_output("9:30")).to eq "9:40"
    end

    it "returns the correct time for the pm" do
      expect(test_availability_output("12:30")).to eq "12:40"
    end

  end
end
