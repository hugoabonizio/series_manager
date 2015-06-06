class SearchController < ApplicationController
  def search
		@series = Serie.where('title LIKE ? OR original_title LIKE ?', "%#{params[:q]}%", "%#{params[:q]}%")
  end
end
