class RecipientsController < ApplicationController
  before_action :set_recipient, except: [:new, :index, :create]

  def index
    @recipients = Recipient.all.select {|recipient| recipient.locations.count > 0}
    @markers = []
    @recipients.each do |recipient|
     recipient.locations.each do |location|
      if location.primary == true
        hash = {
          lat: location.latitude,
          lng: location.longitude,
          infoWindow: { content: render_to_string(partial: "shared/info_window", locals: { recipient: recipient }) }
        }
        @markers << hash
      end
    end
  end
end

def new
  @recipient = Recipient.new
  @location = Location.new
end

def create
  @recipient = Recipient.new(recipient_params)
  @recipient.user = current_user
  @location = Location.new(address: params[:recipient][:location][:address])
  @location.primary = true
  @location.save
  @recipient.locations << @location
  if @recipient.save
      # authorize @recipient
      redirect_to recipient_path(@recipient)
    else
      render "new"
    end
  end

  def edit
    # authorize @recipient
  end

  def update
    # authorize @recipient
    @recipient.update(recipient_params)
    if @recipient.save
      redirect_to recipient_path
    else
      render "edit"
    end
  end

  def destroy
    # authorize @recipient
    @recipient.delete
  end

  def show
    @markers = []
    @primary = []
    @recipient.locations.each do |location|
      hash = {
        lat: location.latitude,
        lng: location.longitude
      }
      #if location.primary == true
      #  @primary << hash
      #else
        @markers << hash
      #end
    end
  end

  private

  def set_recipient
    @recipient = Recipient.find(params[:id])
  end

  def recipient_params
    params.require(:recipient).permit(:first_name, :last_name, :gender, :dob, :bio, :phone_number, :photo)
  end

  # def location_params
  #   params.require(:recipient).permit(:locations_attributes)
  # end

end
