class ProfilesController < ApplicationController
  def show
    @profile = Profile.find(params[:id])
    render json: @profile
  end

  def create
    # TODO
  end

end
