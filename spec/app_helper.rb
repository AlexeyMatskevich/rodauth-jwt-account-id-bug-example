# frozen_string_literal: true

require "spec_helper"
require "pry"
require ::File.expand_path("../../app", __FILE__)

Dir[File.expand_path("support", __dir__) + "/**/*.rb"].sort.each { |f| require f }

RSpec.configure do |config|
  config.include AccountHelper
  config.include RequestHelper
end
