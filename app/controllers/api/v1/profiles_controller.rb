module Api
  module V1
    class ProfilesController < ApplicationController
      before_action :authenticate_user!, only: [:me, :update, :show]
      before_action :current_profile, only: [:me, :update]

      def me
        response_success(@profile)
      end

      def show
        @profile = Profile.find_by(id: params[:id])
        @profile = Profile.new unless @profile.present?
        response_success(@profile)
      end

      def update
        @profile.attributes = jsonapi_parse_params
        response_errors(@profile) unless @profile.save!
      end

      private
      def current_profile
        @profile = Profile.find_by(user: current_user)
        @profile = Profile.new(user: current_user) unless @profile.present?
      end
    end
  end
end