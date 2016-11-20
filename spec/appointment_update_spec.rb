describe Appointment_Update do

  before(:each) do
    parsed_json = JSON.parse(mock_original_availability_slots_json)
    @update = Appointment_Update.new(parsed_json)
    @path = double(:path)
  end

  it "returns with the indexed time unavailable" do
    output_in_ruby = JSON.parse(@update.update_availability_slots(2, @path))
    expect(output_in_ruby).to eq JSON.parse(mock_updated_availability_slots_json)["availability_slots"]
  end

  it "return a valid JSON" do
    expect { JSON.parse(@update.update_availability_slots(2, @path)) }.to_not raise_error
  end
end
