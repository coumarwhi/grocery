FactoryBot.define do
  factory :grocery_list do
    title { "groceries" }
    description { "grocery_description" }
  end 

  factory :user do
    email { "fake@fake.com" }
    password { "password" }
  end 
end 