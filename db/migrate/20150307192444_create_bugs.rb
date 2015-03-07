class CreateBugs < ActiveRecord::Migration
  def change
    create_table :bugs do |t|
      t.string :name
      t.text :description
      t.string :platform

      t.timestamps
    end
  end
end
