#!/usr/bin/env ruby
require_relative './lib/appointment'

time = ARGV[0]
path = "./availability_slots.json"

json = File.read(path)

appointment = Appointment.new(time, json)
puts appointment.get_an_appointment

index = appointment.appointment_index

update = Appointment_Update.new(json)
update.update_availability_slots(index, path)
