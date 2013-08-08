class AddPaperclipFieldsToMeetup < ActiveRecord::Migration
  def change
    add_column :meetups, :image_file_name,    :string
    add_column :meetups, :image_content_type, :string
    add_column :meetups, :image_file_size,    :integer
    add_column :meetups, :image_updated_at,   :datetime
  end
end
