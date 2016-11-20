#!/usr/bin/env ruby
require_relative './lib/appointment'

time = ARGV[0]
path = "./availability_slots.json"

json = File.read(path)

appointment = Appointment.new(time, json)
puts appointment.get_an_appointment

index = appointment.appointment_index

parsed_json = JSON.parse(json)
update = Appointment_Update.new(parsed_json)
update.update_availability_slots(index, path)
