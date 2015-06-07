module ApplicationHelper
	def title
		return "#{@title} | Series" unless @title.nil?
		"Series"
	end
end
