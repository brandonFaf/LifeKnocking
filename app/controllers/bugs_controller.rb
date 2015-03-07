class BugsController < ApplicationController
	def index
		@bugs = Bug.all
	end

	def new 
		@bug = Bug.new
	end

	def create
		@bug = Bug.create(bug_params)
		if @bug.save
			redirect_to bugs_path, notice: "Thank you for submitting the bug."
		else
			render action: 'new', alert: "didn't save"
		end
	end

	def destroy
		bug = Bug.find(params[:id])
		if bug.destroy
			render action 'index', notice: 'Bug Deleted'
		else
			render action 'index', alert: "Bug was not deleted"
		end
	end

	def update
		bug = Bug.find(params[:id])
		bug.update!(bug_params)
		redirect_to bug
	end

	def edit
		@bug = Bug.find(params[:id])
	end

	def show
		@bug = Bug.find(params[:id])
	end

	def bug_params
		params.require(:bug).permit(:name, :description, :platform, :title)
	end

rescue_from CanCan::AccessDenied do |exception|
    redirect_to bugs_path, :alert => 'You do not have permission to do access that action'
  end

end
