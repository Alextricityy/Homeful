
class UsersController < ApplicationController

  before_action :set_user, except: [:index]

  def index
    @users = User.all?
  end


  def show

    @recipients = @user.recipients
    #locations = []
    @markers = []
    @recipients.each do |recipient|
       recipient.locations.each do |location|
        if location.primary
         @markers << {
            lat: location.latitude,
            lng: location.longitude,
            infoWindow: { content: render_to_string(partial: "shared/info_window", locals: { recipient: recipient }) }
          }
        end
      end
    end
 end

  def edit
   if current_user != @user
        redirect_to root_path
      end

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
    redirect_to root_path
  end

  private
  def set_user
     @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:first_name, :last_name, :bio, :email, :date_of_birth)
  end


end
