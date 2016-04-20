class AddPhotoToMicroposts < ActiveRecord::Migration
  def change
    add_column :microposts, :photo, :string
  end
end
