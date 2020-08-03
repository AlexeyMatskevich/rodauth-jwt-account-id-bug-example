# frozen_string_literal: true

require "app_helper"

describe "#jwt-refresh", type: :request do
  let!(:account_id) { create_account(status_id: 2, email: "name@name.ru", password: "9876556789") }
  let(:refresh_token) { get_tokens(login: "name@name.ru", password: "9876556789")["refresh_token"] }

  it "return access token with account id in payload" do
    json_post "jwt-refresh", {refresh_token: refresh_token}

    expect(JWT.decode(body["access_token"], ENV["JWT_SECRET"]).any? { |hash| hash["account_id"] == account_id  } ).to be true
  end
end
