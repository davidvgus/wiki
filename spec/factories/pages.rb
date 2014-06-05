# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :page do
    title "MyString"
    content "MyText"
    owner_id 1
    private false
  end
end
