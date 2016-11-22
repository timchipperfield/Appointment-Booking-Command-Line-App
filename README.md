# Appointment Booking Command Line App [![Build Status](https://travis-ci.org/timchipperfield/Appointment-Tech-Test.svg?branch=master)](https://travis-ci.org/timchipperfield/Appointment-Tech-Test) [![Coverage Status](https://coveralls.io/repos/github/timchipperfield/Appointment-Tech-Test/badge.svg?branch=master)](https://coveralls.io/github/timchipperfield/Appointment-Tech-Test?branch=master)

The task is to create an app that will allow patients to book appointments with a doctor, using the dataset provided.

## Running Instructions
1. Clone repo to local repository
2. Run bundle
3. Go to the root of the directory
4. To start the app: type: './availability.rb time' (where time is formatted in 24 hour time, ex. 13:45)
5. The response will be a time in 12-hour format (see constraints below)

## To Run Tests
Type 'rspec' in the terminal.

## Requirements
You should create a command line app that accepts a single argument, which is the time that the patient would like to book to see a doctor. Eg:

$ ./availability.rb 12:40
The app should check which is the next available slot and book it. It should print the time of the appointment that was booked

## Additional Requirements
Patients cannot book appointments before 8am and after 3pm. Once an availability has been used up for an appointment it cannot be booked again.

In the dataset there are multiple doctors (id: 1 & 2) and each doctor can only have 1 appointment per slot. For example, you could potentially book 12:20 once for doctor 1 and again for doctor 2.

## Constraints
Please use the JSON file provided to load availability into your app.
Your app should be an executable ruby script (command line).
Your app should accept a time (eg: 12:40)
Your app should print the time that was booked (eg: 1:10)
