class SuggestionsController < ApplicationController
	def index
		@suggestions = Suggestion.all
	end

	def new 
		@suggestion = Suggestion.new
	end

	def create
		@suggestion = Suggestion.create(suggestion_params)
		if @suggestion.save
			redirect_to suggestions_path, notice: 'Thank you for submitting the suggestion.'
		else
			render action: 'new', alert: "didn't save"
		end
	end

	def destroy
		suggestion = Suggestion.find(params[:id])
		if suggestion.destroy
			render action 'index', notice: 'Suggestion Deleted'
		else
			render action 'index', alert: "Suggestion was not deleted"
		end
	end

	def update
		suggestion = Suggestion.find(params[:id])
		suggestion.update!(suggestion_params)
		redirect_to suggestion
	end

	def edit
		@suggestion = Suggestion.find(params[:id])
	end

	def show
		@suggestion = Suggestion.find(params[:id])
	end

	def suggestion_params
		params.require(:suggestion).permit(:name, :description, :title)
	end

rescue_from CanCan::AccessDenied do |exception|
    redirect_to suggestions_path, :alert => 'You do not have permission to do access that action'
  end

end
