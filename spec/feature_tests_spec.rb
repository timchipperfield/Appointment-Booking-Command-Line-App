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

  context "when entering an invalid time" do

    it "can manage a time which is out of bounds" do
      expect(test_availability_output("17:30")).to eq "Sorry, we're closed for the day. Please try again tomorrow"
    end
  end

  context "when entering consecutive times" do

    it "can print same starting times in different slots" do
      test_availability_output("13:05")
      expect(test_availability_output("13:05")).to eq "1:20"
    end

    it "can print consecutive times in the same slot if there are two doctors" do
      test_availability_output("14:45")
      expect(test_availability_output("14:45")).to eq "2:50"
    end
  end


end
