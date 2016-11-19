require 'spec_helper'

describe Appointment do

  context "single appointment" do

    before(:each) do
      @json = File.read('./spec/mock_availability_slots.json')
      mock_update_class
    end

    it "can return one of the times allocated in the JSON" do
      time = "8:40"
      appointment = Appointment.new(time, @json)
      expect(appointment.get_an_appointment).to eq "8:50"
    end

    it "can't be held before 8 am" do
      time = "7:00"
      appointment = Appointment.new(time, @json)
      expect(appointment.get_an_appointment).to eq "8:00"
    end

    it "can't be held after 3 pm" do
      time = "15:10"
      appointment = Appointment.new(time, @json)
      expect(appointment.get_an_appointment).to eq "Sorry, we're closed for the day. Please try again tomorrow"
    end
  end

  context "sequential appointments" do

    before(:each) do
      @json = File.read('./spec/mock_availability_slots.json')
      mock_update_class
    end

    it "allows one appointment to be made after another" do
      time1 = "8:40"
      time2 = "8:50"
      appointment1 = Appointment.new(time1, @json)
      appointment2 = Appointment.new(time2, @json)
      expect(appointment2.get_an_appointment).to eq "9:10"
    end

    it "does not allow the appointments to use the same availability slot" do
      time1 = "8:30"
      time2 = "8:30"
      @json_updated = mock_updated_availability_slots_json

      appointment1 = Appointment.new(time1, @json)
      appointment2 = Appointment.new(time2, @json_updated)

      expect(appointment2.get_an_appointment).to eq "9:10"
    end
  end
end
