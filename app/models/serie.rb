class Serie < ActiveRecord::Base
	has_many :episodes
	
	def self.group_episodes(serie)
		@result = Hash.new { |hash, key| hash[key] = [] }
		serie.episodes.each do |ep|
			@result[ep.season] << ep
		end
		@result
	end
end
