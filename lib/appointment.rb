require 'json'


class Appointment

  def initialize(time, json)
    @time = Time.parse(time)
    @json = JSON.parse(json)
  end

  def get_an_appointment
    format_time(search_available_slots["time"])
  end

  def search_available_slots
    @json["availability_slots"].find do |slot|
      Time.parse(slot["time"]) > @time
    end
  end

  def format_time(time)
    Time.parse(time).strftime("%l:%M").gsub(" ", "")
  end

end
