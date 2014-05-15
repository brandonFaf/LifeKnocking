class AddDescriptionToPodcast < ActiveRecord::Migration
  def change
  	change_column :podcasts, :description, :text

  end
end
