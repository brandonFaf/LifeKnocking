class PagesController < ApplicationController
	
	def about
	end

	def contact
	end

	def home
		_posts = Post.all
		_posts += Podcast.all
		@posts = _posts.sort do |a, b| b.created_at <=> a.created_at end
	end

	def game
		render :layout => false
	end

	def gameInfo
	end
	
		
end
