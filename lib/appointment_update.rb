class Appointment_Update

  def initialize(json)
    @json = json
  end

  def update_availability_slots(index_to_be_changed)
    updated_slots = revised_parsed_json(index_to_be_changed)
    convert_to_pretty_json(updated_slots)
  end

  private

  def revised_parsed_json(index_to_be_changed)
    @json["availability_slots"].map do |slot|
      return_slots(slot, index_to_be_changed)
    end
  end

  def return_slots(slot, index_to_be_changed)
    if (slot == @json["availability_slots"][index_to_be_changed])
       slot["slot_size"] = 0
    end
    slot
  end

  def convert_to_pretty_json(parsed_json)
    JSON.pretty_generate(parsed_json)
  end

end
