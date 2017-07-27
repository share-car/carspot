class UsersController < ApplicationController
  def show
    byebug
    
    @user = User.find(params[:id])
    render json: @user
  end
end
