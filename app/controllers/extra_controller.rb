class ExtraController < ApplicationController
	# def index
	# 	@extra 
	# end

  def create
  	@extra = Extra.new(extra_params)
		
		if @extra.save
			episode = Episode.find(@extra.episode_id)
  	pod = episode.podcast
			redirect_to pod, alert: 'photo successfully saved'
		else
			render action: 'new', alert:'ran into an issue'	
		end
  end

  def new
  	@extra = Extra.new
  	@extra.episode_id = params[:episode_id]
				authorize! :manage, current_user
  end

  def edit
  	@extra = Extra.find(params[:id])
				authorize! :manage, current_user
  end

  def update
		extra = Extra.find(params[:id])
		extra.update!(extra_params)
		episode = Episode.find(extra.episode_id)
  	pod = episode.podcast
		redirect_to pod
  end

  def destroy
  	extra = Extra.find(params[:id])
  	episode = Episode.find(extra.episode_id)
  	pod = episode.podcast
		extra.destroy
		redirect_to pod, notice: 'deleted'
  end

  def extra_params
		params.require(:extra).permit(:title, :body, :episode_id)
	end
end
