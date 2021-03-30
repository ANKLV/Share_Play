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
      let(:params) { { id: playlist.id } }

      subject { -> { delete :destroy, params: params } }

      it {
        playlist.reload
        is_expected.to change { Playlist.count }.by(-1)
      }
    end

    describe '#show' do
      let(:params) { { id: playlist.id } }
      it 'returns playlist' do
        get :index
        expect(response).to have_http_status(:ok)
      end
    end

    describe '#update' do
      context 'with good data' do
        before { patch :update, params: { id: playlist.id, playlist: playlist_params } }

        subject { response }

        it { is_expected.to have_http_status(:ok) }
      end

      context 'with bad data' do
        before { patch :update, params: { id: playlist.id, playlist: { title: '' } } }

        subject { response }

        it { is_expected.to have_http_status(:unprocessable_entity) }
      end
    end
  end
end
