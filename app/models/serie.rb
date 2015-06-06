class Serie < ActiveRecord::Base
	has_many :episodes
	
	def self.group_episodes(serie)
# 		@result = Hash.new(Hash.new)
# # 		@result = Array.new(20) { Array.new }
# 		serie.episodes.each do |ep|
# 			@result[ep.season][ep.episode] = ep
# 		end
# # 		@result.each { |s| s.sort { |a, b| a.episode <=> b.episode } }
		serie.episodes.group_by { |ep| ep.season }
	end
end
