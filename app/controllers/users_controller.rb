class UsersController < ApplicationController
  skip_before_action :require_login, only: [:new, :create]
  def index
    @users = User.all_except(current_user)
  end

  def new
    @user = User.new
  end

  def create
    @user = sign_up(user_params)

    if @user.valid?
      sign_in(@user)
      redirect_to user_path(@user)
    else
      render :new
    end
  end

  def show
    @user = User.find(params[:id])
    @friendships = @user.friendships
  end

  private

  def user_params
    params.require(:user).permit(
      :email,
      :password,
      :first_name,
      :last_name,
      :city,
      :state,
      :image_url
    )
  end
end
