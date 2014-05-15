class PodcastsController < ApplicationController
	def index
	    @pods = Podcast.all

	end

	def feed
		@pods = Podcast.all
		respond_to do |format|
   			format.xml { render :layout => false }
   			format.atom
		end
	end

	def new
		@pod = Podcast.new
				authorize! :manage, current_user

	end

	def create 
		@pod = Podcast.new(pod_params)
		
		if @pod.save
			redirect_to action: 'index', alert: 'photo successfully saved'
		else
			render action: 'new', alert:'ran into an issue'	
		end
	end

	def edit
		@pod = Podcast.find(params[:id])
				authorize! :manage, current_user

	end

	def update
		pod = Podcast.find(params[:id])
		pod.update!(pod_params)
		redirect_to pod
	end

	def destroy
		pod = Podcast.find(params[:id])
		pod.destroy
		redirect_to action: 'index', notice: 'deleted'
	end

	def show
		@pod = Podcast.find(params[:id])
	end


	def pod_params
		params.require(:podcast).permit(:title, :description, :audio, :notes)
	end

rescue_from CanCan::AccessDenied do |exception|
    redirect_to podcasts_path, :alert => 'You do not have permission to do access that action'
  end

end
