class CreatePlaylistTracks < ActiveRecord::Migration[6.1]
  def change
    create_table :playlist_tracks do |t|
      t.references :track, index: true
      t.references :playlist, index: true
      t.integer :position

      t.timestamps
    end
  end
end
