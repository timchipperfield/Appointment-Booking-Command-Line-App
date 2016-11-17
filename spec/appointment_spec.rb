require 'appointment'

describe Appointment do

  before(:each) do
    time = "12:40"
    json = double(:availability_slots)
    @appointment = Appointment.new(time, json)
  end

  it "returns and appointment when passed a time and a JSON" do
    expect(@appointment.get_an_appointment).to eq "12:50"
  end
end
