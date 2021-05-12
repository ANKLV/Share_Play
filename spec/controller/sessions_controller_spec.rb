# frozen_string_literal: true

require 'rails_helper'
RSpec.describe Api::V1::SessionsController, type: :controller do
  let(:user) { create(:user, password: 'password', password_confirmation: 'password') }
  let(:valid_params) { {email: user.email, password: 'password'} }

  describe '#create' do
    subject { post :create, params: valid_params }

    it { is_expected.to have_http_status(:created) }

    # context 'should create a record' do
    #   it 'saves the user' do
    #     expect { subject }.to change(User, :count).by(1)
    #   end
    # end
  end
end
