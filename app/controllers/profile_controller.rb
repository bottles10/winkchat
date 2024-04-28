class ProfileController < ApplicationController
  before_action :authenticate_user!
  before_action :find_username, only: %i[show edit update]
  before_action :check_owner, only: %i[edit update]
  def show
    @posts = User.find_by(username: params[:username]).posts.order(created_at: :desc)
  end

  def edit
  end

  def update
    if @user.update(profile_params)
      redirect_to profile_path(@user.username), notice: "Profile updated successfully!"
    else
      render :edit, alert: "Profile not updated, please check form."
    end
  end

  private

  def find_username
    @user = User.find_by(username: (params[:username]))
  end

  def check_owner
    unless current_user == @user
      redirect_to root_path, alert: "Hey!  you are not #{@user.username.capitalize}"
    end
  end

  def profile_params
    params.require(:user).permit(:avatar, :bio)
  end
end
