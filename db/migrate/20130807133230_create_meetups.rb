class CreateMeetups < ActiveRecord::Migration
    def change
      create_table :meetups do |t|
        t.string :title
        t.text :body
        # t.string :venue_name

        t.timestamps
      end
    end
end
