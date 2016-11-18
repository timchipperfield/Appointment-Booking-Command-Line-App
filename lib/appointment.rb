require 'json'
require 'time'

class Appointment

  def initialize(time, json)
    @time = Time.parse(time)
    @json = JSON.parse(json)
  end

  def get_an_appointment
    if search_available_slots
      format_time(search_available_slots["time"])
    else
      "Sorry, we're closed for the day. Please try again tomorrow"
    end
  end

  private

  def search_available_slots
    @json["availability_slots"].find do |slot|
         Time.parse(slot["time"]) > @time
    end
  end

  def format_time(time)
      Time.parse(time).strftime("%l:%M").gsub(" ", "")
  end

end
