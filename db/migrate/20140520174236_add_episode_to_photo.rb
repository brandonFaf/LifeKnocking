class AddEpisodeToPhoto < ActiveRecord::Migration
  def change
  	add_column :photos, :episode_id, :integer
  end
end
