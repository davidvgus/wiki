# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  sequence(:title) { |n| "#{Faker::Address.city}#{n}" }
  factory :page do
    title
    content { Faker::Lorem::paragraph }
    owner_id { FactoryGirl.create(:user).id }
    #private false
  end
end
