class LocationsController < ApplicationController
  before_action :set_recipient, only: :create

  def create
    @location = Location.new(location_params)
    @location.recipient = @recipient
    if @location.safe
      redirect_to recipient_path(@recipient)
    else
      render "recipient/show"
    end
  end

  def edit
  end

  def update
    @location = location.find(params[:location_id])
    @location.address = params[:address]
    @location.save
  end


  private

  def set_recipient
    @recipient = recipient.find(params[:id])
  end

  def location_params
    params.require(:address)
  end

end
