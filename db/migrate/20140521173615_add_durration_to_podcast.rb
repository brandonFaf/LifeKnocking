class AddDurrationToPodcast < ActiveRecord::Migration
  def change
  	add_column :podcasts, :durration, :string
  end
end
