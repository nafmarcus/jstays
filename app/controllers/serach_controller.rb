class SearchController < ApplicationController
	
	def search
		@properties = Property.where(location: params[:location]).where(duration: params[:duration])
	end

end