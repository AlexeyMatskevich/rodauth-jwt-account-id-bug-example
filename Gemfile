# frozen_string_literal: true

source "https://rubygems.org"

gem "roda", "~> 3.34"
# Server
gem "sequel", "~> 5.33"
gem "sequel_pg", "~> 1.13"
gem "sequel_tools", "~> 0.1"
gem "sequel-seed", "~> 1.1"
# Authentication
gem "rodauth", git: "https://github.com/jeremyevans/rodauth.git"
gem "bcrypt", "~> 3.1"
gem "jwt", "~> 2.2"
# Tasks
gem "rake", "~> 13.0"
gem "mail", "~> 2.7"

# console
gem "pry", "~> 0.13.1"
group :development, :test do
  # linters:
  gem "rspec", "~> 3.9"
  gem "rack-test", "~> 1.1"
  gem "database_cleaner-sequel", "~> 1.8"
end
