class Waiting::DashboardsController < ApplicationController
  before_action :set_uuid

  def index
  end

  def set_uuid
    @toilet = Toilet.find_by!(uuid: params[:uuid])
  end
end
