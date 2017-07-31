module Api
  module V1
    class CarsController < ApplicationController
      before_action :set_car, only: [:show, :update, :destroy]
      def index
        @cars = Car.all
        response_paging(@cars, ['user', 'vehicle_info', 'chassi', 'transmission', 'fuel_type'], { users: [:name] })
        paginate json: @cars
      end

      def show
        # @car = Car.find(params[:id]) // deleted by Trung.
        response_success(@car, ['user', 'vehicle_info','chassi', 'transmission', 'fuel_type'], { users: [:name] })
      end

      # POST /cars
      def create
        @car = Car.new(car_params)
        if @car.save
          render json: @car, status: :created
        else
          render json: @car.errors, status: :unprocessable_entity
        end
      end

      # PATCH cars/1
      def update
        if @car.update(car_params)
          render json: @car
        else
          render json: @car.errors, status: :unprocessable_entity
        end
      end

      # DELETE /cars/1
      def destroy
        @car.destroy
      end

      private

      def set_car
        @car = Car.find(params[:id])
      end

      def car_params
        params.permit(:engine, :horsepower, :torque, :doors,
                                     :seats, :chassi_id, :transmission_id, :fuel_type_id)
      end
    end
  end
end
