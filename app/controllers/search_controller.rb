class SearchController < ApplicationController
  def search
		@series = Serie.where('title LIKE ? OR original_title LIKE ?', "%#{params[:q]}%", "%#{params[:q]}%")
		@title = params[:q] unless params[:q].nil?
  end
end
