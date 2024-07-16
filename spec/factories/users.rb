# frozen_string_literal: true

FactoryBot.define do
  factory :user, aliases: [:author] do
    username { Faker::Name.first_name }
    email { Faker::Internet.email }
    password { 'TestPassword333!' }
    password_confirmation { 'TestPassword333!' }
    traits_for_enum :role
  end
end
