# frozen_string_literal: true

require 'rails_helper'
RSpec.describe PlaylistsController, type: :controller do
  let(:playlist) { create(:playlist) }
  let(:playlist_params) { attributes_for(:playlist) }

  describe '#index' do
    it 'returns a success response' do
      get :index
      expect(response).to have_http_status(:ok)
    end
  end

  describe '#create' do
    subject { post :create, params: { playlist: playlist_params } }

    it { is_expected.to have_http_status(:created) }

    context 'should create a record' do
      it 'saves the playlist' do
        expect { subject }.to change(Playlist, :count).by(1)
      end
    end

    context 'should not create a record' do
      let(:playlist_params) { { title: '' } }

      it 'saves the playlist' do
        expect { subject }.to_not change(Playlist, :count)
      end
    end
    describe '#destroy' do
      subject { delete :destroy, params: params }
      let(:params) { { id: playlist.id } }

      it 'deletes playlist' do
        playlist.reload
        expect { subject }.to change(Playlist, :count).by(-1)
      end
    end
    describe '#show' do
      before { get :index }

      it 'returns playlist' do
        expect(response).to have_http_status(:ok)
      end
    end
    describe '#update' do
      context 'with good data' do
        it 'updates the playlist' do
          playlist.reload
          subject { patch :update, params: params }
          expect(response).to have_http_status(:created)
        end
      end
      context 'with bad data' do
        it 'does not change the playlist' do
          subject { patch :update, params: params }
          expect(response).not_to be_redirect
        end
      end
    end
  end
end
