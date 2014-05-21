class ChangeEpisodeToEpisodeId < ActiveRecord::Migration
  def change
  	rename_column :podcasts, :episode, :episode_id
  end
end
