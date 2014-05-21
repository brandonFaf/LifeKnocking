class AddPodcastAndPhotosToEpisode < ActiveRecord::Migration
  def change
  	add_column :episodes, :podcast_id, :integer
  	add_column :episodes, :photo_id, :integer
  end
end
