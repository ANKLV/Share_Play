# frozen_string_literal: true

FactoryBot.define do
  factory :user do
    nickname { 'MyString' }
    email { FFaker::Name.unique.name }
    password { '123456' }
  end
end
