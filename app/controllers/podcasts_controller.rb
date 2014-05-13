class PodcastsController < ApplicationController
	def index
		@pods = Podcast.all
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

	def edit
		@pod = Podcast.find(params[:id])
	end

	def update
		respond_to do |format|
      if @pod.update(pod_params)
        format.html { redirect_to @pod, notice: 'pod was successfully updated.' }
        format.json { render :show, status: :ok, location: @pod }
      else
        format.html { render :edit }
        format.json { render json: @pod.errors, status: :unprocessable_entity }
      end
    end
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

end
