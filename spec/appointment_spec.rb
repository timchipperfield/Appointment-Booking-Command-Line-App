require 'spec_helper'

describe Appointment do

  context "single appointment" do

    before(:each) do
      @json = JSON_SAMPLE_MOCK.to_json
    end

    it "can return one of the times allocated in the JSON" do
      time = "8:40"
      @appointment = Appointment.new(time, @json)
      expect(@appointment.get_an_appointment).to eq "8:50"
    end

    it "can't be held before 8 am" do
      time = "7:00"
      @appointment = Appointment.new(time, @json)
      expect(@appointment.get_an_appointment).to eq "8:00"
    end

    it "can't be held after 3 pm" do
      time = "15:10"
      @appointment = Appointment.new(time, @json)
      expect(@appointment.get_an_appointment).to eq "Sorry, we're closed for the day. Please try again tomorrow"
    end

  end

  context "sequential appointments" do
  end
end
