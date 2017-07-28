class ApplicationController < ActionController::API
  include DeviseTokenAuth::Concerns::SetUserByToken
  def jsonapi_parse_params(only = nil)
    ActiveModelSerializers::Deserialization.jsonapi_parse(params, only: only)
  end

  def response_errors(resource, status: 442)
    render json: resource, status: status, adapter: :json_api, serializer: ActiveModel::Serializer::ErrorSerializer
  end
end
