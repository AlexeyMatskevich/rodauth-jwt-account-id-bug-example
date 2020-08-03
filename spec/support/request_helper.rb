# frozen_string_literal: true

module RequestHelper
  def json_post(path, data = {}, access_token = nil)
    headers = access_token ? {"HTTP_AUTHORIZATION" => "Bearer: #{access_token}"} : {}

    post(path, data.to_json, **headers.merge("CONTENT_TYPE" => "application/json"))
  end

  def body
    JSON.parse(last_response.body)
  end
end
