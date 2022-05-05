class Manager::ToiletsController < Manager::BaseController
  def index
    @toilets = current_user.toilets.order(created_at: :desc)
    @toilet = current_user.toilets.new
  end

  def create
    @toilet = current_user.toilets.new(toilet_params)
    if @toilet.save
      @toilet = current_user.toilets.new
    end
    @toilets = current_user.toilets.order(created_at: :desc)
  end

  def toilet_params
    params.require(:toilet).permit(:name)
  end

end
