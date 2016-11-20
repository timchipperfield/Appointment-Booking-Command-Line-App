# require 'spec_helper'
# #
# # RSpec.describe 'It is an executable command line application', :type => :aruba do
# #  let(:file) { '../../availability.rb' }
# #  it { expect(file).to be_an_existing_executable }
# #
# #
# # end
# #
# RSpec.describe 'First Run', :type => :aruba, :io_wait_timeout => 6 do
#   it "can do things" do
#  setup_aruba
#  run("./availability.rb 9:30")
#  stop_all_commands
#  sleep(3)
#
#  expect(last_command_started.output).to eq '9:40'
#  end
# end
