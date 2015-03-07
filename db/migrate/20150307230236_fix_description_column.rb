class FixDescriptionColumn < ActiveRecord::Migration
  def change
  	rename_column :suggestions, :desciption, :description
  end
end
