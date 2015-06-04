class SeriesController < ApplicationController
  def index
  end

  def show
		@serie = Serie.joins(:episodes).group(:season).find(params[:id])
  end
end
