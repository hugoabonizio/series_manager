class SeriesController < ApplicationController
  def index
  end

  def show
		@serie = Serie.includes(:episodes).find(params[:id])
		@seasons = @serie.episodes.group_by { |ep| ep.season }
		@watched = Watched.where(user_id: current_user.id, series_id: params[:id]).map { |ep| ep.episode_id }
  end
end
