class RecipientsController < ApplicationController
  before_action :set_recipient, except: [:new, :index, :create]

  def index
    @recipients = Recipient.all
  end

  def new
    @recipient = Recipient.new
  end

  def create
    @recipient = Recipient.new(recipient_params)
    # authorize @recipient
    @recipient.user = current_user
    if @recipient.save
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
    # authorize @recipient
  end

  private

  def set_recipient
    @recipient = Recipient.find(params[:id])
  end

  def recipient_params
    params.require(:recipient).permit(:first_name, :last_name, :gender, :dob, :bio, :phone_number, :photo)
end
end
