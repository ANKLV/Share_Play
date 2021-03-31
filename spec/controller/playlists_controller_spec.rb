# frozen_string_literal: true

require 'rails_helper'
RSpec.describe Api::V1::PlaylistsController, type: :controller do
  let(:playlist) { create(:playlist) }
  let(:playlist_params) { attributes_for(:playlist) }

  describe '#index' do
    subject { get :index }

    it { is_expected.to have_http_status(:ok) }
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

      it do
        expect { subject }.to_not change(Playlist, :count)
      end
    end

    describe '#destroy' do
      subject { -> { delete :destroy, params: { id: playlist.id } } }

      it {
        playlist.reload
        is_expected.to change { Playlist.count }.by(-1)
      }
    end

    describe '#show' do
      subject { get :show, params: { id: playlist.id } }

      it { is_expected.to have_http_status(:ok) }
    end

    describe '#update' do
      context 'with good data' do
        subject { patch :update, params: { id: playlist.id, playlist: playlist_params } }

        it { is_expected.to have_http_status(:ok) }
      end

      context 'with bad data' do
        subject { patch :update, params: { id: playlist.id, playlist: { title: '' } } }

        it { is_expected.to have_http_status(:unprocessable_entity) }
      end
    end
  end
end
