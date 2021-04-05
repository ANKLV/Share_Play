# frozen_string_literal: true

require 'rails_helper'
RSpec.describe Api::V1::TracksController, type: :controller do
  let(:track) { create(:track) }
  let(:track_params) { attributes_for(:track) }

  describe '#index' do
    subject { get :index }

    it { is_expected.to have_http_status(:ok) }
  end

  describe '#create' do
    subject do
      lambda {
        post :create, params: { track: {
          audio: Rack::Test::UploadedFile.new("#{Rails.root}/spec/fixtures/files/test.mp3"),
          name: 'test', artist: 'bon'
        } }
      }
    end

    it { is_expected.to change(ActiveStorage::Attachment, :count).by(1) }
    it { is_expected.to change(Track, :count).by(1) }

    context 'should not create a record' do
      let(:track_params) { { artist: '', name: '' } }

      it do
        expect { subject }.to_not change(Track, :count)
      end
    end

    describe '#destroy' do
      subject { -> { delete :destroy, params: { id: track.id } } }

      it {
        track.reload
        is_expected.to change { Track.count }.by(-1)
      }
    end

    describe '#show' do
      subject { get :show, params: { id: track.id } }

      it { is_expected.to have_http_status(:ok) }
    end

    describe '#update' do
      context 'with good data' do
        subject { patch :update, params: { id: track.id, track: track_params } }

        it { is_expected.to have_http_status(:ok) }
      end

      context 'with bad data' do
        subject { patch :update, params: { id: track.id, track: { artist: '', name: '' } } }

        it { is_expected.to have_http_status(:unprocessable_entity) }
      end
    end
  end
end
