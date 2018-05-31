
class UsersController < ApplicationController

  before_action :set_user, except: [:index]

  def index
    @users = User.all?
  end


  def show

    # @recipients = @user.recipients
    # raise
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
