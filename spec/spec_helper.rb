require 'appointment'
require 'helpers'
require 'json'
require "childprocess"
require "tempfile"

RSpec.configure do |config|

  config.include Helpers

  $LOAD_PATH.unshift File.expand_path('../../lib', __FILE__)
  ::Dir.glob(::File.expand_path('../support/**/*.rb', __FILE__)).each { |f| require_relative f }

  config.expect_with :rspec do |expectations|

    expectations.include_chain_clauses_in_custom_matcher_descriptions = true
  end
  config.mock_with :rspec do |mocks|

    mocks.verify_partial_doubles = true
  end

  config.shared_context_metadata_behavior = :apply_to_host_groups

end
$LOAD_PATH.unshift File.expand_path('../../lib', __FILE__)
