class AddStitcherIdToPodcast < ActiveRecord::Migration
  def change
  	add_column :podcasts, :stitcher_id, :integer
  end
end
