class AttachmentsController < ApplicationController
  def show
    @attachment = Attachment.find(params[:id])
    render json: @attachment
  end
end
