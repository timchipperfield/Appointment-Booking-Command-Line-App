require 'appointment'
require 'json'

RSpec.configure do |config|

  config.expect_with :rspec do |expectations|

    expectations.include_chain_clauses_in_custom_matcher_descriptions = true
  end
  config.mock_with :rspec do |mocks|

    mocks.verify_partial_doubles = true
  end

  config.shared_context_metadata_behavior = :apply_to_host_groups

  def mock_update_class
    @update_class = stub_const("Appointment_Update", double("update_class"))
    @update = double("instance of update")
    allow(@update_class).to receive(:new) {@update}
    allow(@update).to receive(:update_availability_slots)
  end

  def mock_updated_availability_slots_json
    File.read('./spec/mock_availability_slots_updated.json')
  end

  def mock_original_availability_slots_json
    File.read('./spec/mock_availability_slots.json')
  end

end
