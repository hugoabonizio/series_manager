class SeriesController < ApplicationController
  def index
  end

  def show
		@serie = Serie.includes(:episodes).find(params[:id])
		@seasons = @serie.episodes.group_by { |ep| ep.season }
  end
end
