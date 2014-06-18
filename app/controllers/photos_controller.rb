class PhotosController < ApplicationController
	def index
		@episodes = Episode.all
		@photos = Photo.all
	end

	def tabs
		@episodes = Episode.all
		@photos = Photo.all
	end

	def new
		@photo = Photo.new
		  	@photo.episode_id = params[:episode_id]

				authorize! :manage, current_user

	end

	def create
		@photo = Photo.new(photo_params)

		if @photo.save
			episode = Episode.find(@photo.episode_id)
  	pod = episode.podcast
			redirect_to pod, notice: 'photo saved'
		else
			render action: 'new', alert: 'something went wrong'
		end
	end

	def destroy
		photo = Photo.find(params[:id])
		photo.destroy
		redirect_to action: 'index', notice: 'deleted'
	end

	def show
		@photo = Photo.find(params[:id])
		
	end

	def edit
		@photo = Photo.find(params[:id])
				authorize! :manage, current_user

	end

	def update
		@photo = Photo.find(params[:id])
		@photo.update!(photo_params)
		episode = Episode.find(@photo.episode_id)
  	pod = episode.podcast
		redirect_to pod
	end


	def photo_params
		params.require(:photo).permit(:title, :caption, :pic, :episode_id)
	end

	rescue_from CanCan::AccessDenied do |exception|
    redirect_to photos_path, :alert => 'You do not have permission to do access that action'
  end

end
