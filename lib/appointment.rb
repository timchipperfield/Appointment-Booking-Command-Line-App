require 'json'
require 'time'
require_relative './appointment_update'

#can provide an appointment and its index from the json if one is available

class Appointment

  def initialize(time, json)
    @time = Time.parse(time)
    @parsed_json = JSON.parse(json)
  end

  def get_an_appointment
    if search_available_slots
      format_time(search_available_slots["time"])
    else
      "Sorry, we're closed for the day. Please try again tomorrow"
    end
  end

  def appointment_index
    get_slot_index(search_available_slots)
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

end
