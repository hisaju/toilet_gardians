class UserSessionsController < ApplicationController
  layout 'top'
  def new
    @user = User.new
    @user.toilets.new
  end

  def create
    if login(params[:email], params[:password])
      redirect_to manager_toilets_path
    else
      flash.now[:danger] = 'ログイン出来ませんでした'
      render :new
    end
  end

  def destroy
    logout
    redirect_to new_user_session_path
  end
end
