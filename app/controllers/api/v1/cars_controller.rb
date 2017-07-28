module Api
  module V1
    class CarsController < ApplicationController
      def index
        @cars = Car.all
        response_paging(@cars, ['user', 'vehicle_info', 'chassi', 'transmission', 'fuel_type'], { users: [:name] })
      end
      
      def show
        @car = Car.find(params[:id])
        response_success(@car, ['user', 'vehicle_info','chassi', 'transmission', 'fuel_type'], { users: [:name] })
      end
    end
  end
end
