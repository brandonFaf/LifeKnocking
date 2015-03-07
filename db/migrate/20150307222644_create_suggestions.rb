class CreateSuggestions < ActiveRecord::Migration
  def change
    create_table :suggestions do |t|
      t.string :title
      t.string :name
      t.text :desciption

      t.timestamps
    end
  end
end
