class EpisodesController < ApplicationController
  def watch
		episodes = []
		params[:episodes].each do |episode|
			episodes << Watched.new(episode_id: episode, user_id: current_user.id, series_id: params[:serie])
		end
		Watched.import episodes
		render text: 'SAVED'
  end
end
