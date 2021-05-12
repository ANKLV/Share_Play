# frozen_string_literal: true

FactoryBot.define do
  factory :user do
    nickname { 'MyString' }
    email { FFaker::Internet.email }
    password { '123456' }
  end
end
