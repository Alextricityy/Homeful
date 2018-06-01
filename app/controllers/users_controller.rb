
class UsersController < ApplicationController

  before_action :set_user, except: [:index]

  def index
    @users = User.all?
  end


  def show
    if @user.recipients
      @recipients = @user.recipients
      locations = []
      @recipients.each do |recipient|
        locations << recipient.locations
      end

      @markers = locations.map do |location|
        {
          lat: location[0].latitude,
          lng: location[0].longitude#,
          # infoWindow: { content: render_to_string(partial: "/flats/map_box", locals: { flat: flat }) }
        }
      end
    end
  end

  def edit

  end

  def update

    @user.update(user_params)
      if @user.save
      redirect_to users_path
    else
      render "edit"
    end
  end

  def destroy
    @user.delete
  end

  private
  def set_user
     @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:first_name, :last_name, :bio, :email, :date_of_birth)
  end


end
