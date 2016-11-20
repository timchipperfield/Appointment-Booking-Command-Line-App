describe Appointment_Update do

  before(:each) do
    parsed_json = JSON.parse(mock_original_availability_slots_json)
    @update = Appointment_Update.new(parsed_json)
  end

  it "returns with the indexed time unavailable" do
    @update.update_availability_slots(2)
    output_in_ruby = JSON.parse(@update.update_availability_slots(2))
    expect(output_in_ruby).to eq JSON.parse(mock_updated_availability_slots_json)
  end

  it "return a valid JSON" do
    expect { JSON.parse(@update.update_availability_slots(2)) }.to_not raise_error
  end
end
