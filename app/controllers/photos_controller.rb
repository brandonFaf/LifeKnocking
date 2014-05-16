class PhotosController < ApplicationController
	def index
		@photo = Photo.all
	end

	def new
		@photo = Photo.new
				authorize! :manage, current_user

	end

	def create
		@photo = Photo.new(photo_params)

		if @photo.save
			redirect_to action: 'index', notice: 'photo saved'
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
		redirect_to @photo
	end


	def photo_params
		params.require(:photo).permit(:title, :caption, :pic)
	end

	rescue_from CanCan::AccessDenied do |exception|
    redirect_to photos_path, :alert => 'You do not have permission to do access that action'
  end

end
