# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :page do
    title "MyString"
    content "MyText"
    owner_id { FactoryGirl.create(:user).id }
    private false
  end
end
