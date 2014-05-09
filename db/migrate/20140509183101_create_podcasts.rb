class CreatePodcasts < ActiveRecord::Migration
  def change
    create_table :podcasts do |t|
      t.string :title
      t.text :description
      t.attachment :audio
      t.text :notes

      t.timestamps
    end
  end
end
