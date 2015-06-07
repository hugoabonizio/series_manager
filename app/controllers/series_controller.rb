class SeriesController < ApplicationController
  def index
  end

  def show
		@serie = Serie.includes(:episodes).find(params[:id])
		@seasons = @serie.episodes.group_by { |ep| ep.season }
		if user_signed_in?
			@watched = Watched.where(user_id: current_user.id, series_id: params[:id]).map { |ep| ep.episode_id }
		end
		if @serie.title == @serie.original_title
			@title = "#{@serie.original_title}"
		else
			@title = "#{@serie.title} (#{@serie.original_title})"
		end
  end
end
