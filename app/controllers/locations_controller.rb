class LocationsController < ApplicationController
  before_action :set_recipient, only: [:create, :new]

  def new
   @location = Location.new
  end


  def create
    @location = Location.new(location_params)
    @location.recipient = @recipient
    if @location.save
      redirect_to recipient_path(@recipient)
    else
      render "recipient/show"
    end
  end

  def edit
    @location = Location.find(params[:id])
    redirect_to root_path unless @location.recipient.user == current_user
  end

  def update
    @location = Location.find(params[:id])
    @location.address = params[:address]
    @location.save
  end


  private

  def set_recipient
    @recipient = Recipient.find(params[:recipient_id])
  end

  def location_params
    params.require(:location).permit(:address)
  end

end
