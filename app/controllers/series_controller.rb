class SeriesController < ApplicationController
  def index
  end

  def show
		@serie = Serie.joins(:episodes).order('episodes.episode').find(params[:id])
		@seasons = Serie.group_episodes(@serie)
  end
end
