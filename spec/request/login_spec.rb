# frozen_string_literal: true

require "app_helper"

describe "#login", type: :request do
  let!(:account_id) { create_account(status_id: 2, email: "name@name.ru", password: "9876556789") }

  it "return access token with account id in payload" do
    json_post "login", {login: "name@name.ru", password: "9876556789"}

    expect(JWT.decode(body["access_token"], ENV["JWT_SECRET"]).any? { |hash| hash["account_id"] == account_id  } ).to be true
  end
end
