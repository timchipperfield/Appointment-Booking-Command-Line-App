#can take a json and return a new, updated json with a slot filled

class Appointment_Update

  def initialize(json)
    @json = JSON.parse(json)
  end

  def update_availability_slots(index_to_be_changed, json_path = nil)
    json = convert_to_pretty_json(format_json(index_to_be_changed))
    if_path_write_correction(json_path, json)
    return convert_to_pretty_json(format_json(index_to_be_changed))
  end

  private

  def revised_json_array(index_to_be_changed)
    @json["availability_slots"].map do |slot|
      return_slots(slot, index_to_be_changed)
    end
  end

  def if_path_write_correction(json_path, json)
    if json_path
      write_to_file(json_path, json)
    end
  end

  def format_json(index_to_be_changed)
    {"availability_slots" => revised_json_array(index_to_be_changed)}
  end

  def return_slots(slot, index_to_be_changed)
    if index_to_be_changed
      slot_full(slot, index_to_be_changed)
    else
      slot
    end
  end

  def slot_full(slot, index_to_be_changed)
    if (slot == @json["availability_slots"][index_to_be_changed])
       slot["slot_size"] = 0
    end
    slot
  end

  def convert_to_pretty_json(parsed_json)
    JSON.pretty_generate(parsed_json)
  end

  def write_to_file(json_path, json)
    File.open(json_path, 'w') { |f| f.write(json) }
  end

end
