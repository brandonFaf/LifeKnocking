class AddEpisodeToPodcast < ActiveRecord::Migration
  def change
	add_column :podcasts, :episode, :integer 
  end
end
