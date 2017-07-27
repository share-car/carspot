module Api
  module V1
    class CarsController < ApplicationController
      def index
        @cars = Car.all
        paginate json: @cars, include: ['owner', 'chassi', 'transmission', 'fuel_type'], fields: { users: [:name] }
      end
      
      def show
        @car = Car.find(params[:id])
        render json: @car, include: ['owner', 'chassi', 'transmission', 'fuel_type'], fields: { users: [:name] }
      end
    end
  end
end
