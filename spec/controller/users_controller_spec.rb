# frozen_string_literal: true

require 'rails_helper'
RSpec.describe Api::V1::UsersController, type: :controller do
  let(:user) { create(:user) }
  let(:user_params) { attributes_for(:user) }

  describe '#create' do
    subject { post :create, params: { user: user_params } }

    it { is_expected.to have_http_status(:created) }

    context 'should create a record' do
      it 'saves the user' do
        expect { subject }.to change(User, :count).by(1)
      end
    end

    context 'should not create a record' do
      let(:user_params) { { user: { email: '' } } }

      it do
        expect { subject }.to_not change(User, :count)
      end
    end
  end
end
