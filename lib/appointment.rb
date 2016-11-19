require 'json'
require 'time'
require 'appointment_update'

class Appointment

  def initialize(time, json, path = "./spec/mock_availability_slots.json")
    @time = Time.parse(time)
    @parsed_json = JSON.parse(json)
    @update = Appointment_Update.new(@parsed_json, path)
  end

  def get_an_appointment
    if search_available_slots
      return format_time(search_available_slots["time"])
      update_json
    else
      "Sorry, we're closed for the day. Please try again tomorrow"
    end
  end

  private

  def search_available_slots
    @parsed_json["availability_slots"].find do |slot|
        check_availability(slot) && check_time(slot)
    end
  end

  def get_slot_index(slot)
    @parsed_json["availability_slots"].index(slot)
  end

  def format_time(time)
      Time.parse(time).strftime("%l:%M").gsub(" ", "")
  end

  def check_time(slot)
    Time.parse(slot["time"]) > @time
  end

  def check_availability(slot)
    slot["slot_size"] == 10
  end

  def update_json
      @update.update_availability_slots(get_slot_index(search_available_slots))
  end

end
