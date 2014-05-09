class PhotosController < ApplicationController
	def index
		@photo = Photo.all
	end

	def new
		@photo = Photo.new
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

	def photo_params
		params.require(:photo).permit(:title, :caption)
	end

end
