module Helpers

  def mock_update_class
    @update_class = stub_const("Appointment_Update", double("update_class"))
    @update_instance = double("instance of update")
    allow(@update_class).to receive(:new) {@update_instance}
    allow(@update_instance).to receive(:update_availability_slots)
  end

  def mock_updated_availability_slots_json
    File.read('./spec/json_mocks/mock_availability_slots_updated.json')
  end

  def mock_original_availability_slots_json
    File.read('./spec/json_mocks/mock_availability_slots.json')
  end

  def normal_slot_array
    json = File.read("./availability_slots.json")
    parsed_json = JSON.parse(json)
    array = []
    array =  parsed_json["availability_slots"].each do |slot|
       slot["slot_size"] = 10
         array << slot
     end
     array
  end

  def write_json_back_to_normal
    to_write = JSON.pretty_generate({"availability_slots" => normal_slot_array})
    File.open("./availability_slots.json", 'w') { |f| f.write(to_write) }
  end

  def test_availability_output(time)
    out = Tempfile.new "out"
    process = ChildProcess.build("./availability.rb", time)
    process.io.stdout = out
    process.io.stderr = out
    process.duplex = true
    process.start

    process.poll_for_exit 6
    out.rewind
    return out.read.chomp
  end

end
