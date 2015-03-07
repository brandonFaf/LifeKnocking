class AddTitleToBugs < ActiveRecord::Migration
  def change
    add_column :bugs, :title, :string
  end
end
