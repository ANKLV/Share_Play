class TrackSerializer < ActiveModel::Serializer
  attributes :id, :name, :artist, :duration
end
