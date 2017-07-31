class ApplicationController < ActionController::API
  include DeviseTokenAuth::Concerns::SetUserByToken

  before_action :configure_permitted_parameters, if: :devise_controller?

  def jsonapi_parse_params(only = nil)
    ActiveModelSerializers::Deserialization.jsonapi_parse(params, only: only)
  end

  def response_errors(resource, status: 442)
    render json: resource, status: status, adapter: :json_api, serializer: ActiveModel::Serializer::ErrorSerializer
  end

  def response_success(resource, include = [], fields = {})
    render json: resource, include: include, fields: fields
  end

  def response_paging(resource, include = [], fields = nil)
    paginate json: resource, include: include, fields: fields
  end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
  end
end
