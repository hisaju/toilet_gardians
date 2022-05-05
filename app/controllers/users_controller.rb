class UsersController < ApplicationController
  layout 'top'
  def new
    @user = User.new
    @user.toilets.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      auto_login(@user)
      redirect_to manager_toilets_path
    else
      render :new
    end
  end

  def user_params
    params.require(:user).permit(:email, :password, :password_confirmation, toilets_attributes: [:name])
  end
end
