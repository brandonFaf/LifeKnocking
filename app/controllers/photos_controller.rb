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
		respond_to do |format|
      if @photo.update(photo_params)
        format.html { redirect_to @photo, notice: 'photo was successfully updated.' }
        format.json { render :show, status: :ok, location: @photo }
      else
        format.html { render :edit }
        format.json { render json: @photo.errors, status: :unprocessable_entity }
      end
    end
	end


	def photo_params
		params.require(:photo).permit(:title, :caption, :pic)
	end

	rescue_from CanCan::AccessDenied do |exception|
    redirect_to photos_path, :alert => 'You do not have permission to do access that action'
  end

end
