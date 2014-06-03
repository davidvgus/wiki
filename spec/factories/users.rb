# Read about factories at https://github.com/thoughtbot/factory_girl

require 'faker'

FactoryGirl.define do
  sequence(:email) { |n| "#{Faker::Name.first_name}#{n}@#{Faker::Internet.domain_name}" }
  sequence(:name) { |n| "#{Faker::Name.first_name}#{n}" }

  factory :user do
    name
    email
    password { Faker::Lorem.characters(10) }
    password_confirmation { |user| user.password }
    after(:build) { |user| user.skip_confirmation! }
  end
end
