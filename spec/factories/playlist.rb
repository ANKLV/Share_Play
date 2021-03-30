# frozen_string_literal: true

FactoryBot.define do
  factory :playlist do
    title { FFaker::Name.unique.name }
  end
end
