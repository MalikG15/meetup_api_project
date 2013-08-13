class CreateLikes < ActiveRecord::Migration
  def change
    create_table :likes do |t|
      t.integer :name

      t.timestamps
    end
  end
end
