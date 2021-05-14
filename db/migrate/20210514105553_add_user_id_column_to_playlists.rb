class AddUserIdColumnToPlaylists < ActiveRecord::Migration[6.1]
  def change
    add_reference :playlists, :user, index: true 
  end
end
