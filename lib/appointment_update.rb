class Appointment_Update

  def initialize(json, path)
    @json = json
    @path = path
  end

  def update_availability_slots(index_to_be_changed)
    revised_json(index_to_be_changed)
  end

  private

  def revised_json(index_to_be_changed)
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

  def rewrite_file(json)
  end

end
