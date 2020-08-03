# frozen_string_literal: true

require "database_cleaner-sequel"

RSpec.configure do |config|
  config.before(:suite) do
    DatabaseCleaner.allow_remote_database_url = true
    DatabaseCleaner[:sequel].db = App::DB
    DatabaseCleaner[:sequel].clean_with(:deletion, {except: ["account_statuses"], pre_count: true})
  end

  config.before(:each) do
    DatabaseCleaner[:sequel].strategy = :transaction
    DatabaseCleaner[:sequel].start
  end

  config.append_after(:each) do
    DatabaseCleaner[:sequel].clean
  end
end
