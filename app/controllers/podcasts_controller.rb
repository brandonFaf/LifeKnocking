class PodcastsController < ApplicationController
	def index
		@pod = Podcast.all
	end

	def new
		@pod = Podcast.new
	end

	def create 
		@pod = Podcast.new(pod_params)
		
		if @pod.save
			redirect_to action: 'index', alert: 'photo successfully saved'
		else
			render action: 'new', alert:'ran into an issue'	
		end
	end



	def pod_params
		params.require(:podcast).permit(:title, :description, :audio, :notes)
	end

end
