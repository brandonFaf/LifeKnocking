class PostsController < ApplicationController
	def index
		@posts = Post.all
	end

	def new 
		@post = Post.new

		authorize! :manage, current_user
	end

	def create
		@post = Post.create(post_params)
		if @post.save
			redirect_to action: 'index'
		else
			render action: 'new', alert: "didn't save"
		end
	end

	def destroy
		post = Post.find(params[:id])
		if post.destroy
			render action 'index', notice: 'Post Deleted'
		else
			render action 'index', alert: "Post was not deleted"
		end
	end

	def update
		post = Post.find(params[:id])
		post.update!(post_params)
		redirect_to post
	end

	def edit
		@post = Post.find(params[:id])

		authorize! :manage, current_user
	end

	def show
		@post = Post.find(params[:id])
	end

	def post_params
		params.require(:post).permit(:title, :content)
	end

rescue_from CanCan::AccessDenied do |exception|
    redirect_to posts_path, :alert => 'You do not have permission to do access that action'
  end

end
