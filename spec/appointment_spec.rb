require 'spec_helper'

describe Appointment do

  before(:each) do
    @json = JSON_SAMPLE_MOCK.to_json
  end


  it "must return one of the times allocated in the JSON" do
    time = "8:40"
    @appointment = Appointment.new(time, @json)
    expect(@appointment.get_an_appointment).to eq "8:50"
  end


end
