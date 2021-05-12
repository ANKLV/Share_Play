# frozen_string_literal: true

require 'rails_helper'
RSpec.describe Api::V1::SessionsController, type: :controller do
  let(:user) { create(:user, password: 'password', password_confirmation: 'password') }
  let(:valid_params) { {email: user.email, password: 'password'} }
  let(:invalid_params) { {email: '', password: ''} }

    describe '#create' do
      subject { post :create, params: valid_params }

      it { is_expected.to have_http_status(:created) }

    context 'with bad data' do
      subject { post :create, params: invalid_params }

      it { is_expected.to have_http_status(:unprocessable_entity) }
    end
  end
end
