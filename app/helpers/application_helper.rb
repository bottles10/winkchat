module ApplicationHelper
	include Pagy::Frontend

	def time_ago_in_words_for(obj)
		time_ago_in_words(obj).sub(/about/, '')
	end		
end
