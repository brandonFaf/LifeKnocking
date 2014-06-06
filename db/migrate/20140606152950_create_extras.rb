class CreateExtras < ActiveRecord::Migration
  def change
    create_table :extras do |t|
      t.string :title
      t.string :body

      t.timestamps
    end
  end
end
