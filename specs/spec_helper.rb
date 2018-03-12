require 'simplecov'
SimpleCov.start do
  add_filter "/specs"
end

require 'minitest'
require 'minitest/autorun'
require 'minitest/reporters'

Minitest::Reporters.use! Minitest::Reporters::SpecReporter.new

require_relative '../lib/room'
require_relative '../lib/reservation'
require_relative '../lib/booking'
require_relative '../lib/validate'
