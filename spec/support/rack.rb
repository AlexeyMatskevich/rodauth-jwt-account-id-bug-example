# frozen_string_literal: true

require "rack/test"

RSpec.configure do
  include Rack::Test::Methods

  def app
    App.freeze.app
  end
end
