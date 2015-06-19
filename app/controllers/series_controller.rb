class SeriesController < ApplicationController
  def index
		@series = Serie.page(params[:page]).per(12)
  end

  def show
		@serie = Serie.includes(:episodes).find(params[:id])
		@seasons = @serie.episodes.group_by { |ep| ep.season }
		if user_signed_in?
			@watched = Watched.where(user_id: current_user.id, serie_id: params[:id]).map { |ep| ep.episode_id }
			@favorite = !Favorite.find_by(user_id: current_user.id, serie_id: params[:id]).nil?
		end
		
		if @serie.title == @serie.original_title
			@title = "#{@serie.original_title}"
		else
			@title = "#{@serie.title} (#{@serie.original_title})"
		end
  end
	
	def favorite
		respond_to do |format|
			@fav = Favorite.where(serie_id: params[:serie_id], user_id: current_user.id)
			if @fav.blank?
				@result = :create
				Favorite.create(serie_id: params[:serie_id], user_id: current_user.id)
			else
				@result = :destroy
				Favorite.find_by(serie_id: params[:serie_id], user_id: current_user.id).destroy
			end
			format.js
		end
	end
end
