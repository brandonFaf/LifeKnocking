class RemovePhotoIdFromEpisode < ActiveRecord::Migration
  def change
  	remove_column :episodes, :photo_id, :integer
  	remove_column :podcasts, :episode_id, :integer
  end
end
