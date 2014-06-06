class AddEpisodeToExtra < ActiveRecord::Migration
  def change
  	add_column :extras, :episode_id, :integer
  end
end
