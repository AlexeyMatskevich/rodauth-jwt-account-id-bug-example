# frozen_string_literal: true

module AccountHelper
  def create_account(password:, **args)
    password_hash = BCrypt::Password.create(password, cost: BCrypt::Engine::MIN_COST)

    App::DB[:accounts].insert(password_hash: password_hash, **args)
  end

  def get_tokens(login:, password:)
    post "/login", {login: login, password: password}.to_json, "CONTENT_TYPE" => "application/json"

    JSON.parse(last_response.body)
  end
end
