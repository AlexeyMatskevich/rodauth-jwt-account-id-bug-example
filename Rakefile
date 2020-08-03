# frozen_string_literal: true

require "bundler/setup"
require "sequel_tools"
require "uri"
url = ENV.fetch("DATABASE_URL", "postgres://postgres:postgres@localhost:5432")
uri = URI.parse url
database = uri.path.to_s.split("/")[1] || "test_#{ENV["RACK_ENV"] || "development" }"

base_config = SequelTools.base_config(
  project_root: File.expand_path(__dir__),
  dbadapter: uri.scheme || "postgres",
  dbname: database,
  username: uri.user || "postgres",
  password: uri.password || ENV["PGPASSWORD"] || nil,
  dbhost: uri.host || "localhost",
  dbport: uri.port || "5432",
  log_level: :info,
  dump_schema_on_migrate: ENV["RACK_ENV"] == "development",
  pg_dump: "pg_dump --no-owner"
)

namespace "db" do
  SequelTools.inject_rake_tasks base_config, self
end

Rake::Task["db:seed"].clear

namespace "db" do
  desc "Creates a new seed"
  task :new_seed, [:name] do |_task, args|
    abort("Seed name is missing - aborting") unless args[:name]
    require "time"
    filename = "db/seeds/#{Time.now.strftime "%Y%m%d%H%M%S"}_#{args[:name]}.rb"
    File.write filename, <<~MIGRATIONS_TEMPLATE_END
      Sequel.seed do
        def run

        end
      end
    MIGRATIONS_TEMPLATE_END
    puts "The new seed file was created under #{filename.inspect}"
  end

  desc "Load seeds from db/seeds"
  task :seed do
    require "sequel"
    require "sequel/extensions/seed"

    url += "/#{database}" if url.gsub("postgres://", "").split("/")[1].nil?

    Sequel.extension :seed
    DB = Sequel.connect(url)
    Sequel::Seeder.apply(DB, ::File.expand_path("../db/seeds", __FILE__))
  end
end
