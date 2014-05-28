FactoryGirl.define do
  factory :user do
    provider "github"
    sequence(:uid) {|n| n}
    name "MyString"
		login "MyString"
    email "user@example.com"
  end
end
