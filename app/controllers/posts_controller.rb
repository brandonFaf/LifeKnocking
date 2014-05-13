class PostsController < ApplicationController
	def index
		@posts = Post.all
	end

	def new 
		@post = Post.new
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

	def show
		@post = Post.find(params[:id])
	end

	def post_params
		params.require(:post).permit(:title, :content)
	end
end
