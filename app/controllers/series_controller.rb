class SeriesController < ApplicationController
  def index
  end

  def show
		@serie = Serie.includes(:episodes).find(params[:id])
		@seasons = Serie.group_episodes(@serie)
  end
end
