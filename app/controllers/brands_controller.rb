class BrandsController < ApplicationController
  def index
    @brands = Brand.all
    render json: @brands
  end

  def create
    @brands = Brand.create!(brand_params)
    render json: @brands
  end

  private
  def brand_params
    params.permit(:name)
  end
end
