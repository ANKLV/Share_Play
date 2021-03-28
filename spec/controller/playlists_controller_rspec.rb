# frozen_string_literal: true

require 'rails_helper'
RSpec.describe PlaylistsController, type: :controller do
  describe 'GET #index' do
    it 'returns a success response' do
      get :index
      expect(response).to have_http_status(:ok)
    end
    it 'assigns @playlists' do
      playlist = Playlist.create
      get :index
      expect(assigns(:playslists)).to eq([playlist])
    end
  end
end
