FactoryBot.define do
  factory :grocery_list do
    title { "groceries" }
    description { "grocery_description" }
  end 

  factory :user do
    email { "fake@fake.com" }
    password { "password" }
  end 

  factory :grocery_item do
    content { 'fakeitem' }
  end
end 