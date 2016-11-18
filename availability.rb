#!/usr/bin/env ruby
require_relative './lib/appointment'

time = ARGV[0]
json = File.read("./availability_slots.json")

appointment = Appointment.new(time, json)
puts appointment.get_an_appointment
